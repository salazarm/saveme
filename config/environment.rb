# Load the rails application
require File.expand_path('../application', __FILE__)

require 'pusher'
Pusher.app_id = 46055
Pusher.key = '15d403a27437d1df3be4'
Pusher.secret = 'b597c32148bc85ca03a0'
Pusher.logger = Rails.logger

# Initialize the rails application
Saveme::Application.initialize!
