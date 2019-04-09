Raven.configure do |config|
  config.dsn = 'https://774c7dbdb0304995af09d6b633d6c371:2fecc80d42a9418aa3268723022f5503@sentry.io/1433184'
  config.sanitize_fields = Rails.application.config.filter_parameters.map(&:to_s)
end
