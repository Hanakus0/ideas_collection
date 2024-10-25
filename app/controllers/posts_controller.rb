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
    @post = Post.new(post_params)

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
      genre = PostGenre.find_by(name: params.require(:post)[:post_genre_type])
      # submit_flg = Post.findparams.require(:post)[:draft_flg]

      params.require(:post).permit(:post_uid, :images, :title, :content, :draft_flg).merge(user_id: current_user.id, post_genre_id: genre.id);
    end
end
