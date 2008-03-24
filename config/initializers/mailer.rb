# manage action mailer
ActionMailer::Base.delivery_method       = :sendmail
ActionMailer::Base.raise_delivery_errors = true
ActionMailer::Base.default_charset       = "utf-8"
ActionMailer::Base.perform_deliveries    = true

ActionMailer::Base.smtp_settings = {
  :address        => "91.121.101.144",
  :port           => 25,
  :password       => 'TWsi6>K!',
  :user_name      => "mail",
  :authentication => :login
}