class Users::FollowsController < ApplicationController
  before_action :authenticate_user!

  def index
    @followees = current_user.followees.order(created_at: :desc).page(params[:page]).per(5)
  end

  def create
    @followee = User.find(params[:id])
    current_user.follow(@followee)
  end

  def destroy
    @followee = User.find(params[:id])
    current_user.unfollow(@followee)
  end

end
