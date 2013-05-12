class HomeController < ApplicationController

  def index
    redirect_to :action => 'edit', :controller => 'crushes', :id => current_user.id unless current_user.form_done?
  end
end