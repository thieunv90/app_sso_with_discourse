class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    if session[:external_site]
      super
    else
      session[:external_site] = nil if session[:external_site].present?
      root_path
    end
  end
end
