class Admin::CommentsController < ApplicationController
  before_action :set_admin_comment, only: %i[ show edit update destroy ]

  # GET /admin/comments or /admin/comments.json
  def index
    @admin_comments = Comment.all
  end

  # GET /admin/comments/1 or /admin/comments/1.json
  def show
  end

  # GET /admin/comments/new
  def new
    @admin_comment = Comment.new
  end

  # GET /admin/comments/1/edit
  def edit
  end

  # POST /admin/comments or /admin/comments.json
  def create
    @admin_comment = Comment.new(admin_comment_params)

    respond_to do |format|
      if @admin_comment.save
        format.html { redirect_to @admin_comment, notice: "Comment was successfully created." }
        format.json { render :show, status: :created, location: @admin_comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admin_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/comments/1 or /admin/comments/1.json
  def update
    respond_to do |format|
      if @admin_comment.update(admin_comment_params)
        format.html { redirect_to @admin_comment, notice: "Comment was successfully updated." }
        format.json { render :show, status: :ok, location: @admin_comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admin_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/comments/1 or /admin/comments/1.json
  def destroy
    @admin_comment.destroy!

    respond_to do |format|
      format.html { redirect_to admin_comments_path, status: :see_other, notice: "Comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_comment
      @admin_comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_comment_params
      params.require(:admin_comment).permit(:user_id, :post_id, :content)
    end
end
