# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  :user_name => 'app70494220@heroku.com',
  :password => 'xndjvoo46974',
  :domain => 'damp-lowlands-31233.herokuapp.com',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}

ENV['RECAPTCHA_PUBLIC_KEY']  = '6LfWRycUAAAAAOMwc2tlePOLsyZ4Nos9aIAcxq7m'
ENV['RECAPTCHA_PRIVATE_KEY'] = '6LfWRycUAAAAAANlbXcOxVH_GpfkcjeBF0VUYoB0'