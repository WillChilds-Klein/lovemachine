class HomeController < ApplicationController
  include Format
  before_filter CASClient::Frameworks::Rails::Filter

  def index
    redirect_to :action => 'edit', :controller => 'crushes', :id => current_user.uuid unless current_user.form_done?
    @matches = current_user.matches.map{|email| full_name(email)}
    @hints = Hint.where(:email => current_user.email)
  end
end