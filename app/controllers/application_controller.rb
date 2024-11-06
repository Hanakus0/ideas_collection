class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  # allow_browser versions: :modern

  # devise でのログイン成功後の遷移先
  def after_sign_in_path_for(resource)
    if current_user
      flash[:notice] = "ログインに成功しました"
      root_url  #　指定したいパスに変更
    else
      flash[:notice] = "新規登録完了しました"
      edit_user_registration_path  #　指定したいパスに変更
    end
  end

end
