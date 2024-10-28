class Users::ProfilesController < ApplicationController
  before_action :set_user, only: %i[ show edit update ]
  # deviseによるログイン済みかの判定
  before_action :authenticate_user!, except: %i[ show ]

  def show
    # raise
  end

  def edit
  end

  def update
    # raise
    if @user.update(profile_params)
      redirect_to users_profile_path(@user.screen_name), notice: "Post was successfully updated."
    else
      # profile_image_cacheからimageを復元
      # @user.profile_image.retrieve_from_cache!(params[:user][:profile_image_cache])
      # @user.profile_image_cache = @user.profile_image.cache_name
      render :edit, status: :unprocessable_entity
    end
  end

  private ##############################################################
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find_by(screen_name: params[:screen_name])
  end

  # Only allow a list of trusted parameters through.
  def profile_params
    params.require(:user).permit(:screen_name, :account_name, :profile_image, :profile_image_cache, :gender, :age, :introduction)
  end
end
