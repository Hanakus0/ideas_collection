class Users::FollowsController < ApplicationController
  # deviseによるログイン済みかの判定
  before_action :authenticate_user!
  # フォロー対象のユーザー情報を取得
  before_action :set_followee_user, only: %i[ create destroy ]

  # フォロワー一覧表示
  def index
    @followees = current_user.followees.order(created_at: :desc).page(params[:page]).per(5)
  end

  # フォロー処理
  def create
    current_user.follower_relationships.create(followee_id: @followee.id)
    flash[:notice] = t("messages.follow_info", account_name: @followee.account_name)
    redirect_to users_profile_path(@followee.screen_name)
  end

  # フォローを外す処理
  def destroy
    target_followee = current_user.follower_relationships.find_by(followee_id: @followee.id)
    target_followee.destroy
    flash[:notice] = t("messages.unfollow_info", account_name: @followee.account_name)
    redirect_to users_profile_path(@followee.screen_name), status: :see_other
  end

  private ##################################################################

    # フォロー対象のユーザー情報を取得
    def set_followee_user
      @followee = User.find_by(screen_name: params[:screen_name])
    end
end
