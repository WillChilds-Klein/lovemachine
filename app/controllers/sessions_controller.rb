class SessionsController < ApplicationController
  before_filter CASClient::Frameworks::Rails::Filter

  def login
    redirect_to '/'
  end

  def logout
    CASClient::Frameworks::Rails::Filter.logout(self)
    redirect_to '/'
  end
end