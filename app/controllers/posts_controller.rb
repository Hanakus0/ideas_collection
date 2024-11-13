class PostsController < ApplicationController
  # 対象ポストの取得
  before_action :set_post, only: %i[ show edit update destroy ]
  # 検索パラメータの取得
  before_action :set_q_order, only: %i[ index ]
  # deviseによるログイン済みかの判定
  before_action :authenticate_user!, except: %i[ index ]
  # 編集権限の確認
  before_action :is_match_login_user, only: %i(edit update destroy)

  # GET /posts
  def index
    # フラグ無し
    @posts = Post.where(draft_flg: 0).order(created_at: :desc).page(params[:page]).per(10)

    # 検索なら検索を実行
    if params[:q].present? && params[:q][:search_flg].present?
      # 検索時
      @posts = PostSearchForm.new(search_post_params).search.page(params[:page]).per(10)
    end
  end

  # GET
  def show
    # ビューをカウント
    postRecord = PostRecord.find_by(post_id: @post)
    postRecord.countup_view unless postRecord.blank?
    # コメントフォーム用
    @comment = Comment.new
    @comments = @post.comments.order(created_at: :desc)
  end

  # GET /posts/new
  def new
    @post = Post.new
    @quote_post = Post.find_by(post_uid: params[:quote_post_id])
    # 引用投稿か否か
    if !!(@quote_post)
      @quote_post.quote_relations.new
    end
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  def create
    # 親クラスからインスタンスを取得しレコードを生成
    @post = get_post_genre.posts.build(post_params)
    # 引用投稿のパラメータ
    quote_post_param = params.require(:post)[:quote_post]
    # 引用投稿した投稿の取得
    @quote_post = Post.find(quote_post_param) if quote_post_param
    # 引用投稿した投稿の取得
    @post_tags = modify_post_tags

    if @post.save
      # ジャンルの設定
      @post.create_post_record(post_id: @post.id)
      # 引用先の設定
      @post.quote_posts << @quote_post if @quote_post
      # 投稿のタグ設定
      register_article_tags(@post, @post_tags) if @post_tags

      flash[:success] = t('messages.post_success')
      redirect_to post_path(@post)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT
  def update
    # ジャンルの更新
    @post.post_genre = get_post_genre
    # 引用投稿した投稿の取得
    @post_tags = modify_post_tags

    if @post.update(update_params)
      # 投稿のタグ設定
      register_article_tags(@post, @post_tags) if @post_tags
      flash[:success] = t('messages.update_post_success')
      redirect_to post_path(@post.post_uid)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE
  def destroy
    @post.destroy!
    flash[:success] = t('messages.destroy_post_success')
    redirect_to posts_path, status: :see_other
  end

  # ブックマークした投稿のみを一覧表示
  def bookmarks
    @bookmark_posts = current_user.bookmark_posts.order(created_at: :desc).page(params[:page]).per(10)
  end

  # 下書き投稿のみを一覧表示
  def drafts
    @draft_posts = Post.where(draft_flg: 1, user_id: current_user.id).order(created_at: :desc).page(params[:page]).per(10)
  end

  private ###################################################################
    # 投稿一覧の取得
    def set_post
      @post = Post.find_by(post_uid: params[:id])
    end

    # 投稿者本人以外が操作しようとした場合の対策
    def is_match_login_user
      posted_user = Post.find_by(post_uid: params[:id]).user
      redirect_to post_path(@post) unless posted_user.blank? || posted_user == current_user
    end

    # 検索時のパラメータの並び替えの選択肢を渡す
    def set_q_order
      @q_order = {
                    "最新順": "latest",
                    "古い順": "oldest",
                    "いいね数": "post_likes",
                    "コメント数": "post_comments"
                 }
    end

    def search_post_params
      params[:q].permit(:post_genre_id, :how_order, :contents, :tags)
    end

    # params から post_genre の id を割り出す
    def get_post_genre
      post_genre_sym = params.require(:post)[:post_genre_id].to_sym
      get_post_genre_id = Post.post_genre_ids[post_genre_sym]
      PostGenre.find(get_post_genre_id)
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :content, { images: [] }, :images_cache, :draft_flg).merge(post_uid: gen_secure_id, user_id: current_user.id)
    end

    # 新規会員登録時、user_idに重複が無いかをチェックした上で保存する
    def gen_secure_id
      loop do
        gen_uid = SecureRandom.alphanumeric
        return gen_uid if Post.find_by(post_uid: gen_uid) == nil
      end
    end

    # 更新対象のカラムのみ
    def update_params
      update_params = params.require(:post).permit(:title, :content, { images: [] }, :remove_images, :draft_flg)

      # アップロードされた画像がある場合
      new_images_ary = update_params[:images].select { |image| image.class == ActionDispatch::Http::UploadedFile }
      # 新規にアップロードされた画像だけを投稿画像とする
      update_params[:images] = new_images_ary if new_images_ary.present?

      # チェックボックスに応じて投稿画像を削除する
      update_params[:images] = nil if update_params[:remove_images] === 1

      return update_params
    end

    # 投稿のタグを登録用に加工する
    # tagifyで`,`区切りにしているためここで分割
    def modify_post_tags
      if params[:post][:input_post_tags].present?
        tags = params[:post][:input_post_tags].split(",").uniq
      end
    end

    # タグの登録前
    def register_article_tags(post, tags)
      # 一旦該当投稿のタグを全て削除
      post.tags.destroy_all
      # 登録済みのタグがあればそれを登録、なければ新規作成し投稿に関連付け
      tags.each do |tag|
        tag = Tag.find_or_create_by(name: tag)
        post.tags << tag
      end
    end
##########
end
