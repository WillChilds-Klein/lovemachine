# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Lovemachine::Application.initialize!

# CAS shyte
CASClient::Frameworks::Rails::Filter.configure(
  :cas_base_url => "https://secure.its.yale.edu/cas"
)

ActionMailer::Base.smtp_settings = {
  :address              => "smtp.sendgrid.net",
  :port                 => '587',
  :domain               => 'heroku.com',
  :user_name            => ENV['SENDGRID_USERNAME'],
  :password             => ENV['SENDGRID_PASSWORD'],
  :authentication       => :plain,
  :enable_starttls_auto => true  }

ActionMailer::Base.delivery_method = :smtp
