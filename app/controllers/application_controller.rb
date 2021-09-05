class ApplicationController < ActionController::Base
  before_action :configre_permitted_parameters, if: :devise_controller?
  before_action :basic_auth

  private

  def configre_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :last_name, :first_name, :kana_last, :kana_first, :birthday])
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'ratio' && password == '16180'
    end
  end
end
