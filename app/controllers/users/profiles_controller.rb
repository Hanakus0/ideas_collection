class Users::ProfilesController < ApplicationController
  # 対象ユーザー取得
  before_action :set_user
  # deviseによるログイン済みかの判定
  before_action :authenticate_user!
  # 編集権限の確認
  before_action :is_match_login_user, only: %i(edit update)

  def show
  end

  def edit
  end

  def update
    if @user.update(profile_params)
      redirect_to users_profile_path(@user.screen_name), notice: "Post was successfully updated."
    else
      # screen_nameを代入しないと遷移先が指定できない問題の措置
      @user.screen_name = current_user.screen_name
      render :edit, status: :unprocessable_entity
    end
  end

  private ##############################################################
  # ユーザー本人以外がプロフィール編集しようとした場合の対策
  def is_match_login_user
    check_user = User.find_by(screen_name: params[:screen_name])
    redirect_to users_profile_path(check_user.screen_name), notice: "編集権限がありません" unless check_user.blank? || check_user == current_user
  end

  # 閲覧するユーザー情報
  def set_user
    @user = User.find_by(screen_name: params[:screen_name])
  end

  # プロフィールのストロングパラメータ
  def profile_params
    profile_params = params.require(:user).permit(:screen_name, :account_name, :profile_image, :profile_image_cache, :gender, :age, :introduction)

    # チェックされていれば匿名画像を適用
    check_box_val = params.require(:user)[:profile_image_flg]
    profile_params[:profile_image] = nil if check_box_val == "1"

    return profile_params
  end
end
