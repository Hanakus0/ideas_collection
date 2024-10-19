class Admin::CommentLikesController < ApplicationController
  before_action :set_admin_comment_like, only: %i[ show edit update destroy ]

  # GET /admin/comment_likes or /admin/comment_likes.json
  def index
    @admin_comment_likes = CommentLike.all
  end

  # GET /admin/comment_likes/1 or /admin/comment_likes/1.json
  def show
  end

  # GET /admin/comment_likes/new
  def new
    @admin_comment_like = CommentLike.new
  end

  # GET /admin/comment_likes/1/edit
  def edit
  end

  # POST /admin/comment_likes or /admin/comment_likes.json
  def create
    @admin_comment_like = CommentLike.new(admin_comment_like_params)

    respond_to do |format|
      if @admin_comment_like.save
        format.html { redirect_to @admin_comment_like, notice: "Comment like was successfully created." }
        format.json { render :show, status: :created, location: @admin_comment_like }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admin_comment_like.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/comment_likes/1 or /admin/comment_likes/1.json
  def update
    respond_to do |format|
      if @admin_comment_like.update(admin_comment_like_params)
        format.html { redirect_to @admin_comment_like, notice: "Comment like was successfully updated." }
        format.json { render :show, status: :ok, location: @admin_comment_like }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admin_comment_like.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/comment_likes/1 or /admin/comment_likes/1.json
  def destroy
    @admin_comment_like.destroy!

    respond_to do |format|
      format.html { redirect_to admin_comment_likes_path, status: :see_other, notice: "Comment like was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_comment_like
      @admin_comment_like = CommentLike.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_comment_like_params
      params.require(:admin_comment_like).permit(:user_id, :comment_id)
    end
end
