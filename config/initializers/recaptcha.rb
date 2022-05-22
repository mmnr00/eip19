Recaptcha.configure do |config|
  config.site_key  = ENV['CAPTCHA_SITEKEY']
  config.secret_key = ENV['CAPTCHA_SECRETKEY']
end