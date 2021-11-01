# frozen_string_literal: true

Sidekiq.configure_server do
  Rails.application.config.after_initialize do
    scheduler_file = Rails.root.join('config/scheduler.yml')
    Sidekiq::Cron::Job.load_from_hash YAML.load_file(scheduler_file) if File.exist?(scheduler_file)
  end
end
