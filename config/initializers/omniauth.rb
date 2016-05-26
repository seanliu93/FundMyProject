Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['1167125939999757'], ENV['c98ced56cc1de590cac3de2e0640c433']
end