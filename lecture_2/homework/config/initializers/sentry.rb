Raven.configure do |config|
  config.dsn = 'https://9ff29baf7ad9470b9d2926a2d0d37a5e:8795c43bddde4d029997b545ba440944@sentry.io/1439632'
  config.sanitize_fields = Rails.application.config.filter_parameters.map(&:to_s)
end