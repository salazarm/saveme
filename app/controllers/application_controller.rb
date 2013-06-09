class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :current_user
  
  private  
  def current_user
    @current_user = false
    unless cookies[:auth_token].nil?
      @current_user ||= Person.find_by_auth_token(
      	cookies[:auth_token])
    end
  end  

  helper_method :current_user

  before_filter :set_cache_buster

  def set_cache_buster
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end
end