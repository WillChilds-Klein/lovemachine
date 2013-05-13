class SessionsController < ApplicationController
  before_filter CASClient::Frameworks::Rails::Filter

  def login
    redirect_to '/'
  end

  def logout
    reset_session
    redirect_to '/'
  end
end