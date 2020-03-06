class ApplicationController < ActionController::Base

  #ログインし後の遷移先を、adminnかend_userで変更
  def after_sign_in_path_for(resource)
    if end_user_signed_in?
      user_path(current_end_user)
    end
  end
  #ログアウト後の遷移先
  def after_sign_out_path_for(resource)
    root_path
  end
end
