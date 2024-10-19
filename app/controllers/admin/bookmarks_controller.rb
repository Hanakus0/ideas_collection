class Admin::BookmarksController < ApplicationController
  before_action :set_admin_bookmark, only: %i[ show edit update destroy ]

  # GET /admin/bookmarks or /admin/bookmarks.json
  def index
    @admin_bookmarks = Bookmark.all
  end

  # GET /admin/bookmarks/1 or /admin/bookmarks/1.json
  def show
  end

  # GET /admin/bookmarks/new
  def new
    @admin_bookmark = Bookmark.new
  end

  # GET /admin/bookmarks/1/edit
  def edit
  end

  # POST /admin/bookmarks or /admin/bookmarks.json
  def create
    @admin_bookmark = Bookmark.new(admin_bookmark_params)

    respond_to do |format|
      if @admin_bookmark.save
        format.html { redirect_to @admin_bookmark, notice: "Bookmark was successfully created." }
        format.json { render :show, status: :created, location: @admin_bookmark }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admin_bookmark.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/bookmarks/1 or /admin/bookmarks/1.json
  def update
    respond_to do |format|
      if @admin_bookmark.update(admin_bookmark_params)
        format.html { redirect_to @admin_bookmark, notice: "Bookmark was successfully updated." }
        format.json { render :show, status: :ok, location: @admin_bookmark }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admin_bookmark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/bookmarks/1 or /admin/bookmarks/1.json
  def destroy
    @admin_bookmark.destroy!

    respond_to do |format|
      format.html { redirect_to admin_bookmarks_path, status: :see_other, notice: "Bookmark was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_bookmark
      @admin_bookmark = Bookmark.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_bookmark_params
      params.require(:admin_bookmark).permit(:user_id, :post_id)
    end
end
