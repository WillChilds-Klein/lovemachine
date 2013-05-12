class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter CASClient::Frameworks::Rails::Filter

  protected

  def current_user
    @current_user ||= Crush.where(:NetID => session[:cas_user]).first_or_create
  end
end
