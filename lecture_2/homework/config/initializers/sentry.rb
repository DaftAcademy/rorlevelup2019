Raven.configure do |config|
  config.dsn = 'https://f5f6d70b1bc14b22b7840d61fa16f075:90f542392743485bbab30bc55b3eb56c@sentry.io/1436671'
  config.sanitize_fields = Rails.application.config.filter_parameters.map(&:to_s)
end
