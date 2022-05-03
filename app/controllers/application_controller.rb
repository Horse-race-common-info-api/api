class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_action :authenticate_v1_user!, unless: :devise_controller?
end
