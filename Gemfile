source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.4'

# Use Rails as API-only
gem 'rails', '~> 7.0.7'

# Use postgresql as the database for Active Record
gem 'pg', '~> 1.5.6'

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '~> 5.0'

# Handle CORS for API
gem 'rack-cors'

# For environment variable management
gem 'dotenv-rails', groups: %i[development test]

# For API integration
gem 'httparty'

# JSON builder for APIs
gem 'jbuilder'

# Users
gem 'devise'

# Background jobs
# gem "sidekiq"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# Authentication (if needed)
gem 'bcrypt', '~> 3.1.7'

# For generating fake data in tests
gem 'faker'

# For static code analysis and linting
gem 'rbs'
gem 'rubocop-capybara'
gem 'rubocop-rails'
gem 'solargraph'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri mingw x64_mingw]

  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem 'web-console'

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"
end

group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end
