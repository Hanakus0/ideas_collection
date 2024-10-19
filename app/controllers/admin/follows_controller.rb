class Admin::FollowsController < ApplicationController
  before_action :set_admin_follow, only: %i[ show edit update destroy ]

  # GET /admin/follows or /admin/follows.json
  def index
    @admin_follows = Follow.all
  end

  # GET /admin/follows/1 or /admin/follows/1.json
  def show
  end

  # GET /admin/follows/new
  def new
    @admin_follow = Follow.new
  end

  # GET /admin/follows/1/edit
  def edit
  end

  # POST /admin/follows or /admin/follows.json
  def create
    @admin_follow = Follow.new(admin_follow_params)

    respond_to do |format|
      if @admin_follow.save
        format.html { redirect_to @admin_follow, notice: "Follow was successfully created." }
        format.json { render :show, status: :created, location: @admin_follow }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admin_follow.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/follows/1 or /admin/follows/1.json
  def update
    respond_to do |format|
      if @admin_follow.update(admin_follow_params)
        format.html { redirect_to @admin_follow, notice: "Follow was successfully updated." }
        format.json { render :show, status: :ok, location: @admin_follow }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admin_follow.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/follows/1 or /admin/follows/1.json
  def destroy
    @admin_follow.destroy!

    respond_to do |format|
      format.html { redirect_to admin_follows_path, status: :see_other, notice: "Follow was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_follow
      @admin_follow = Follow.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_follow_params
      params.require(:admin_follow).permit(:user_id, :user_id)
    end
end
