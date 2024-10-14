class Admin::PostTagsController < ApplicationController
  before_action :set_admin_post_tag, only: %i[ show edit update destroy ]

  # GET /admin/post_tags or /admin/post_tags.json
  def index
    @admin_post_tags = PostTag.all
  end

  # GET /admin/post_tags/1 or /admin/post_tags/1.json
  def show
  end

  # GET /admin/post_tags/new
  def new
    @admin_post_tag = PostTag.new
  end

  # GET /admin/post_tags/1/edit
  def edit
  end

  # POST /admin/post_tags or /admin/post_tags.json
  def create
    @admin_post_tag = PostTag.new(admin_post_tag_params)

    respond_to do |format|
      if @admin_post_tag.save
        format.html { redirect_to @admin_post_tag, notice: "Post tag was successfully created." }
        format.json { render :show, status: :created, location: @admin_post_tag }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admin_post_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/post_tags/1 or /admin/post_tags/1.json
  def update
    respond_to do |format|
      if @admin_post_tag.update(admin_post_tag_params)
        format.html { redirect_to @admin_post_tag, notice: "Post tag was successfully updated." }
        format.json { render :show, status: :ok, location: @admin_post_tag }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admin_post_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/post_tags/1 or /admin/post_tags/1.json
  def destroy
    @admin_post_tag.destroy!

    respond_to do |format|
      format.html { redirect_to admin_post_tags_path, status: :see_other, notice: "Post tag was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_post_tag
      @admin_post_tag = PostTag.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_post_tag_params
      params.require(:admin_post_tag).permit(:post_id, :tag_id)
    end
end
