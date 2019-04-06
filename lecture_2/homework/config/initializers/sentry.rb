Raven.configure do |config|
  config.dsn = 'https://1b23753457534df6b5cd5b617f8dae82:40ea8a11e8d74b7aac8af85b27ba48bf@sentry.io/1428892'
  config.sanitize_fields = Rails.application.config.filter_parameters.map(&:to_s)
end
