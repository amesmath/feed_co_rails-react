require_relative 'boot'
require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'rails/test_unit/railtie'
# require 'sprockets/railtie' # Remove this since you're not using it
# require 'action_cable/engine' # Uncomment if you're using Action Cable

Bundler.require(*Rails.groups)

module YourAppName
  class Application < Rails::Application
    config.load_defaults 7.0
    config.api_only = true
  end
end
