source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby "2.6.4"
gem "rails", "~> 5.2"

gem "active_link_to"
gem "bootsnap", ">= 1.1.0", require: false  # Reduces boot times through caching; required in config/boot.rb
gem "celluloid"                             # Requirement of sidekiq-rate-limiter gem
gem "jbuilder", "~> 2.5"                    # JSON support
gem "jquery-rails"                          # Jquery support
gem "kaminari"                              # Pagination
gem "mini_magick", "~> 4.9"                 # Use ActiveStorage variant
gem "mixpanel-ruby"                         # Monitoring
gem "newrelic_rpm"                          # Performance Monitoring
gem "puma", "~> 3.12"                       # Web Server
gem "redis", "~> 4.0"                       # Database used for background jobs
gem "sassc-rails"                           # Frontend
gem "sentry-raven"                          # Error Monitoring
gem "shopify_app", "~> 12.0.2"              # Shopify app
gem "sidekiq"                               # Backround processing
gem "sidekiq-rate-limiter"                  # Backround processing
gem "uglifier", ">= 1.3.0"                  # Frontend

group :development, :test do
  gem "bullet"
  gem "dotenv-rails"                          # Load environment variables from .env into ENV in development.
  gem "pry"                                   # Console Improvements
  gem "rb-readline"                           # Error Logging
  gem "rubocop"                               # Style Monitoring
  gem "rubocop-performance"                   # Performance Monitoring
  gem "rubocop-rails"                         # Rails Style Monitoring
end

group :development do
  gem "awesome_print"
  gem "listen"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end

group :test do
  gem "capybara", ">= 2.15", "< 4.0", require: false
  gem "database_cleaner"                                  # DB resets between tests
  gem "factory_bot_rails"
  gem "fake_shopify"                                      # Adds shopify fixtures for testing
  gem "launchy"                                           # Easier launch commands
  gem "rails-controller-testing"                          # Rails controller testing
  gem "rspec-rails", "~> 3.6"
  gem "rspec-sidekiq"
  gem "selenium-webdriver", require: false
  gem "simplecov", require: false                         # Test coverage
  gem "timecop"                                           # Improve control of time in tests
  gem "vcr"                                               # Record http requests for more reliable testing
  gem "webdrivers", require: false
  gem "webmock"                                           # Test HTTP requests
end

group :production, :development do
  gem "pg"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
