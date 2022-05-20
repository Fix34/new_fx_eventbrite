# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
    :user_name => ENV['fxtarbouriech@hotmail.fr'],
    :password => ENV['tarbourie-34'],
    :domain => 'monsite.fr',
    :address => 'smtp.sendgrid.net',
    :port => 587,
    :authentication => :plain,
    :enable_starttls_auto => true
  }