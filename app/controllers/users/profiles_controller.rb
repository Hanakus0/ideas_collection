class Users::ProfilesController < ApplicationController
  before_action :set_user, only: %i[ show edit update ]

  def show

  end

  def edit
  end

  def update
    raise
    if @user.update(profile_params)
      redirect_to users_profile_path(@user.user_uid), notice: "Post was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find_by(user_uid: params[:user_uid])
  end

  # Only allow a list of trusted parameters through.
  def profile_params
    params.require(:user).permit(:screen_name, :account_name, :profile_image, :gender, :age, :introduction)
  end
end
