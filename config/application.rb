require_relative "boot"
require "rails/all"

Bundler.require(*Rails.groups)

module UptimeMonitor
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults "6.0"
  end
end
