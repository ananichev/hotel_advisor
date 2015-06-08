Recaptcha.configure do |config|
  config.public_key  = YAML.load(File.open("#{Rails.root}/config/secrets.yml"))[Rails.env]['recaptcha_public_key']
  config.private_key = YAML.load(File.open("#{Rails.root}/config/secrets.yml"))[Rails.env]['recaptcha_private_key']
end