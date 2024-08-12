require_relative 'boot'
require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'rails/test_unit/railtie'
# Sprockets is not needed in API-only apps, so it remains commented out
# require 'sprockets/railtie'
# Uncomment if you're using Action Cable
# require 'action_cable/engine'

Bundler.require(*Rails.groups)

module FeedCo
  class Application < Rails::Application
    config.load_defaults 7.0
    config.api_only = true

    # CORS setup, only needed if your frontend is on a different domain
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*' # Replace '*' with your frontend's domain in production
        resource '*',
                 headers: :any,
                 methods: %i[get post put patch delete options head]
      end
    end
  end
end
