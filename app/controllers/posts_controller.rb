class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  # deviseによるログイン済みかの判定
  before_action :authenticate_user!, except: %i[ index show ]

  # GET /posts or /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1 or /posts/1.json
  def show

    # ビューをカウント
    postRecord = PostRecord.find_by(post_id: @post)
    postRecord.countup_view unless postRecord.blank?
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    # 親クラスからインスタンスを取得しレコードを保存
    @post = get_post_genre.posts.build(post_params)

    # raise
    if @post.save
      @post.create_post_record(post_id: @post.id)
      redirect_to post_path(@post), notice: "Post was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    # raise
    @post.post_genre = get_post_genre
    if @post.update(update_params)
      redirect_to post_path(@post.post_uid), notice: "Post was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy!

    respond_to do |format|
      format.html { redirect_to posts_path, status: :see_other, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private ###################################################################
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find_by(post_uid: params[:id])
    end

    def set_post_genre
      post = Post.find_by(post_uid: params[:id])
      @post_genre = PostGenre.find(post_genre_id: post.post_genre_id)
    end

    # params から post_genre の id を割り出す
    def get_post_genre
      post_genre_sym = params.require(:post)[:post_genre_id].to_sym
      get_post_genre_id = Post.post_genre_ids[post_genre_sym]
      PostGenre.find(get_post_genre_id)
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:images, :title, :content, :draft_flg).merge(post_uid: gen_secure_id, user_id: current_user.id)
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
      params.require(:post).permit(:title, :content, :images, :draft_flg)
    end
  end
