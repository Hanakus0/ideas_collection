class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  # allow_browser versions: :modern

  # devise でのログイン成功後の遷移先
  def after_sign_in_path_for(resource)
    if current_user
      flash[:notice] = t("messages.signin_info")
      root_url
    else
      flash[:notice] = t("messages.signin_info")
      edit_user_registration_path
    end
  end
end
