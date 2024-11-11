
class Public::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, if: :devise_controller?
  #if: :devise_controller? は、deviseが絡むすべての処理に適用される→つまり、1か所にメソッドをまとめてbefore_actionとして動作させることができる！

  def after_sign_up_path_for(resource)
    flash[:notice] = "ようこそ！ 新規登録しました！"
    root_path
  end

  protected

  def configure_permitted_parameters
    #新規登録の際に、parameterを許可するカラム
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :email])
    #ログインの際に、parameterとして受け取りを許可するカラム
    devise_parameter_sanitizer.permit(:sign_in, keys: [:nickname])
  end

end
