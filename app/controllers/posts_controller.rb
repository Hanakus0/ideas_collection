class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]

  # GET /posts or /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1 or /posts/1.json
  def show

    # ビューをカウント
    postRecord = PostRecord.find_by(post_id: @post)
    postRecord.countup_view
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
    post_genre = PostGenre.find(set_post_genre)
    @post = post_genre.posts.build(post_params)

    if @post.save
      PostRecord.create(post_id: @post.id)
      redirect_to post_path(@post.post_uid), notice: "Post was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    if @post.update(post_params)
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find_by(post_uid: params[:post_uid])
    end

    # params から post_genre の id を割り出す
    def set_post_genre
      Post.post_genre_ids[params.require(:post)[:post_genre_id].to_sym]
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:images, :title, :content, :draft_flg).merge(user_id: current_user.id)
    end
  end
