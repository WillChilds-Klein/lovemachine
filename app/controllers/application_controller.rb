class ApplicationController < ActionController::Base
  include Format
  protect_from_forgery
  
  protected

  def current_user
    @current_user ||= Crush.where(:NetID => session[:cas_user]).first_or_create
  end
end
