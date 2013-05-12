class HomeController < ApplicationController

  def index
    redirect_to :action => 'edit', :controller => 'crushes', :id => current_user.uuid unless current_user.form_done?
  end
end