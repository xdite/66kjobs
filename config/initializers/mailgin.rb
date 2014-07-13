Mailgun.configure do |config|
  config.api_key = Setting.mailgun.api_key
  config.domain  = Setting.mailgun.api_host
end
