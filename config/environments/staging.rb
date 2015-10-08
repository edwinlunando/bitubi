Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false
  config.action_mailer.smtp_settings = {
    address: 'email-smtp.us-west-2.amazonaws.com',
    port: 25,
    user_name: ENV['AWS_SES_USERNAME'],
    password: ENV['AWS_SES_PASSWORD'],
    authentication: :login
  }

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = false

  # Asset digests allow you to set far-future HTTP expiration dates on all assets,
  # yet still be able to expire them through the digest params.
  config.serve_static_files = true
  config.assets.digest = true
  config.assets.cache_store = :memory_store, { size: 32.megabytes }
  config.sass.cache = false
  config.assets.raise_runtime_errors = true
  AssetSync.config.enabled = false

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true
end
