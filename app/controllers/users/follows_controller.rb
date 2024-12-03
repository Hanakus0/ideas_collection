class Users::FollowsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_followee_user, only: %i[ create destroy ]

  def index
    @followees = current_user.followees.order(created_at: :desc).page(params[:page]).per(5)
  end

  def create
    current_user.follower_relationships.create(followee_id: @followee.id)
    flash[:notice] = t("messages.follow_info", account_name: @followee.account_name)
    redirect_to users_profile_path(@followee.screen_name)
  end

  def destroy
    target_followee = current_user.follower_relationships.find_by(followee_id: @followee.id)
    target_followee.destroy
    flash[:notice] = t("messages.unfollow_info", account_name: @followee.account_name)
    redirect_to users_profile_path(@followee.screen_name), status: :see_other
  end

  private ##################################################################

    def set_followee_user
      @followee = User.find_by(screen_name: params[:screen_name])
    end
end
