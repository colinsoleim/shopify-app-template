require "sidekiq/api"

namespace :jobs do
  # Alias to start up sidekiq
  task work: :environment do
    exec("bundle exec sidekiq")
  end

  # Clear out failed jobs quickly for dev/test environments
  task clear: :environment do
    unless Rails.env.production?
      retry_set = Sidekiq::RetrySet.new

      puts "Clearing out #{retry_set.size} jobs"

      retry_set.clear
    end
  end
end
