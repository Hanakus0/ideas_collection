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
    post_genre = PostGenre.find(Post.post_genre_ids[params.require(:post)[:post_genre_id].to_sym])
    @post = post_genre.posts.build(post_params)
    # @post.post_genre << PostGenre.new(name: params.require(:post)[:post_genre_id])

    # raise
    if @post.save
      # Create record `PostRecord`
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

    # Only allow a list of trusted parameters through.
    def post_params
      # post_genre_val = PostGenre.find_by(name: params.require(:post)[:post_genre_id])
      # draft_flg_val = Post.draft_flgs[params.require(:post)[:draft_flg].to_sym]
      # post_genre_val =  Post.post_genre_ids[params.require(:post)[:post_genre_id].to_sym]
      draft_flg_val = Post.draft_flgs[ params.require(:post)[:draft_flg].to_sym ]


      # params.require(:post).permit(:post_genre_id, :draft_flg, :images, :title, :content).merge(user_id: current_user.id)
      # logger.debug "Post.new() => #{ params.require(:post).permit(:images, :title, :content).merge(user_id: current_user.id, post_genre_id: post_genre_val, draft_flg: draft_flg_val) }"

      # logger.debug "Post.new() => #{Post.new(params.require(:post).permit(:images, :title, :content).merge(user_id: current_user.id, post_genre_id: post_genre_val, draft_flg: draft_flg_val)).inspect }"


      # params.require(:post).permit(:images, :title, :content).merge(user_id: current_user.id, post_genre_id: post_genre_val, draft_flg: draft_flg_val)

      params.require(:post).permit(:images, :title, :content).merge(user_id: current_user.id, draft_flg: draft_flg_val)

    end
  end
