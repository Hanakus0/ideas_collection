class Admin::PostLikesController < ApplicationController
  before_action :set_admin_post_like, only: %i[ show edit update destroy ]

  # GET /admin/post_likes or /admin/post_likes.json
  def index
    @admin_post_likes = PostLike.all
  end

  # GET /admin/post_likes/1 or /admin/post_likes/1.json
  def show
  end

  # GET /admin/post_likes/new
  def new
    @admin_post_like = PostLike.new
  end

  # GET /admin/post_likes/1/edit
  def edit
  end

  # POST /admin/post_likes or /admin/post_likes.json
  def create
    @admin_post_like = PostLike.new(admin_post_like_params)

    respond_to do |format|
      if @admin_post_like.save
        format.html { redirect_to @admin_post_like, notice: "Post like was successfully created." }
        format.json { render :show, status: :created, location: @admin_post_like }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admin_post_like.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/post_likes/1 or /admin/post_likes/1.json
  def update
    respond_to do |format|
      if @admin_post_like.update(admin_post_like_params)
        format.html { redirect_to @admin_post_like, notice: "Post like was successfully updated." }
        format.json { render :show, status: :ok, location: @admin_post_like }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admin_post_like.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/post_likes/1 or /admin/post_likes/1.json
  def destroy
    @admin_post_like.destroy!

    respond_to do |format|
      format.html { redirect_to admin_post_likes_path, status: :see_other, notice: "Post like was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_post_like
      @admin_post_like = PostLike.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_post_like_params
      params.require(:admin_post_like).permit(:user_id, :post_id)
    end
end
