class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configuer_permitted_paremeters, if: :devise_controller?

  private

  def configuer_permitted_paremeters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:nickname, :first_name, :last_name, :first_name_reading, :last_name_reading,
                                             :birth_date])
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
    end
  end
end
