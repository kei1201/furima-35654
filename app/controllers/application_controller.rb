class ApplicationController < ActionController::Base
  before_action :configre_permitted_parameters, if: :devise_controller?

  def configre_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :last_name, :first_name, :kana_last, :kana_first, :birthday])
  end

end
