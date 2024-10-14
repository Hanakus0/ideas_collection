class Admin::PostsController < ApplicationController
  before_action :set_admin_post, only: %i[ show edit update destroy ]

  # GET /admin/posts or /admin/posts.json
  def index
    @admin_posts = Post.all
  end

  # GET /admin/posts/1 or /admin/posts/1.json
  def show
  end

  # GET /admin/posts/new
  def new
    @admin_post = Post.new
  end

  # GET /admin/posts/1/edit
  def edit
  end

  # POST /admin/posts or /admin/posts.json
  def create
    @admin_post = Post.new(admin_post_params)

    respond_to do |format|
      if @admin_post.save
        format.html { redirect_to @admin_post, notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @admin_post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admin_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/posts/1 or /admin/posts/1.json
  def update
    respond_to do |format|
      if @admin_post.update(admin_post_params)
        format.html { redirect_to @admin_post, notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @admin_post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admin_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/posts/1 or /admin/posts/1.json
  def destroy
    @admin_post.destroy!

    respond_to do |format|
      format.html { redirect_to admin_posts_path, status: :see_other, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_post
      @admin_post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_post_params
      params.require(:admin_post).permit(:post_uid, :user_id, :post_genre_id, :images, :title, :content, :draft_flg)
    end
end
