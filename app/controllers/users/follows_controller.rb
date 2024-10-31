class Users::FollowsController < ApplicationController
  def index

    # フラグ無し
    # @posts = User.where(draft_flg: 0).order(created_at: :desc).page(params[:page]).per(10)
  end
end
