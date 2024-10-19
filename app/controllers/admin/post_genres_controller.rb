class Admin::PostGenresController < ApplicationController
  before_action :set_admin_post_genre, only: %i[ show edit update destroy ]

  # GET /admin/post_genres or /admin/post_genres.json
  def index
    @admin_post_genres = PostGenre.all
  end

  # GET /admin/post_genres/1 or /admin/post_genres/1.json
  def show
  end

  # GET /admin/post_genres/new
  def new
    @admin_post_genre = PostGenre.new
  end

  # GET /admin/post_genres/1/edit
  def edit
  end

  # POST /admin/post_genres or /admin/post_genres.json
  def create
    @admin_post_genre = PostGenre.new(admin_post_genre_params)

    respond_to do |format|
      if @admin_post_genre.save
        format.html { redirect_to @admin_post_genre, notice: "Post genre was successfully created." }
        format.json { render :show, status: :created, location: @admin_post_genre }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admin_post_genre.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/post_genres/1 or /admin/post_genres/1.json
  def update
    respond_to do |format|
      if @admin_post_genre.update(admin_post_genre_params)
        format.html { redirect_to @admin_post_genre, notice: "Post genre was successfully updated." }
        format.json { render :show, status: :ok, location: @admin_post_genre }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admin_post_genre.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/post_genres/1 or /admin/post_genres/1.json
  def destroy
    @admin_post_genre.destroy!

    respond_to do |format|
      format.html { redirect_to admin_post_genres_path, status: :see_other, notice: "Post genre was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_post_genre
      @admin_post_genre = PostGenre.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_post_genre_params
      params.require(:admin_post_genre).permit(:name)
    end
end
