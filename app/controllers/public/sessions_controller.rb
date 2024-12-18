# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController


  def after_sign_in_path_for(resource)
    flash[:notice] = "ログインしました！"
    root_path
  end

  def after_sign_out_path_for(resource)
    flash[:notice] = "ログアウトしました！"
    new_user_session_path
  end



end
