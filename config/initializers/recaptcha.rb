Recaptcha.configure do |config|
  config.site_key  = ENV.fetch('RECAPTCHA_SITE_KEY')
  config.secret_key = ENV.fetch('RECAPTCHA_SECRET_KEY')

  # config.site_key  = '6LfpWLEUAAAAAHzPhrcypY1ZsZCgiR3TfoRALqzO'
  # config.secret_key = '6LfpWLEUAAAAAO5tEStd9fdYaymGJgKib9Qzr6j1'
  # config.proxy = 'http://myproxy.com.au:8080'
end