# Load the rails application
require File.expand_path('../application', __FILE__)

require 'pusher'
Pusher.app_id = 46082
Pusher.key = '9b7d7a30e65884a707d6'
Pusher.secret = '579eeaea2734d24801b2'
Pusher.logger = Rails.logger

# Initialize the rails application
Saveme::Application.initialize!
