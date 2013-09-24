class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  #after_filter :set_access_control_headers

  def set_access_control_headers 
    response.headers['Access-Control-Allow-Origin'] = '*' 
    response.headers['Access-Control-Request-Method'] = '*' 
  end
end
