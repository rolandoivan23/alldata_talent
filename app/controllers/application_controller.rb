class ApplicationController < ActionController::Base
    protect_from_forgery # Same as above
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :authenticate_user!
    helper_method :current_user

    $stars = [
      '☆☆☆☆☆',
      '★☆☆☆☆',
      '★★☆☆☆',
      '★★★☆☆',
      '★★★★☆',
      '★★★★★'
    ]
 protected

    def configure_permitted_parameters
       devise_parameter_sanitizer.permit(:sign_up, keys: [:ignition_id, :full_name, :department, :summary, :password, :password_confirmation, :email])
       # devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:ignition_id, :full_name, :department, :summary, :password, :password_confirmation) }
    end

end
