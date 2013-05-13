class HomeController < ApplicationController
  before_filter CASClient::Frameworks::Rails::Filter

  def index
    redirect_to :action => 'edit', :controller => 'crushes', :id => current_user.uuid unless current_user.form_done?
  end
end