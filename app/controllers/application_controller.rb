# app/controllers/application_controller.rb
class ApplicationController < ActionController::API
  include AbstractController::Translation
  include DeviseTokenAuth::Concerns::SetUserByToken

  before_action :configure_permitted_parameters, if: :devise_controller?
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :confirm_success_url
    devise_parameter_sanitizer.for(:sign_up) << :provider
    devise_parameter_sanitizer.for(:sign_up) << :uid
    devise_parameter_sanitizer.for(:sign_up) << :full_name
    devise_parameter_sanitizer.for(:sign_up) << :wish_list
    devise_parameter_sanitizer.for(:sign_up) << :brands
    devise_parameter_sanitizer.for(:sign_up) << :is_student
    devise_parameter_sanitizer.for(:sign_in) << :is_student
    devise_parameter_sanitizer.for(:account_update) << :experience_level
    devise_parameter_sanitizer.for(:account_update) << :gender
    devise_parameter_sanitizer.for(:account_update) << :weight
    devise_parameter_sanitizer.for(:account_update) << :height
    devise_parameter_sanitizer.for(:account_update) << :birthdate
    devise_parameter_sanitizer.for(:account_update) << {wish_list:[]}
    devise_parameter_sanitizer.for(:account_update) << :wish_list
    devise_parameter_sanitizer.for(:account_update) << {brands:[]}
    devise_parameter_sanitizer.for(:account_update) << :brands
    devise_parameter_sanitizer.for(:account_update) << :photo_url
    devise_parameter_sanitizer.for(:account_update) << :is_student

    # devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:experience_level, :gender, :weight, :height,:birthdate)}

  end
  ##
  # Authentication Failure
  # Renders a 401 error
  def authentication_error
    # User's token is either invalid or not in the right format
    render json: {error: t('unauthorized')}, status: 401  # Authentication timeout
  end
end
