Rails.application.config.sorcery.submodules =
  [ :reset_password, :remember_me ]

Rails.application.config.sorcery.configure do |config|
  config.user_config do |user|
    user.username_attribute_names = [ :email ]
    user.stretches = 1 if Rails.env.test?

    user.downcase_username_before_authenticating = true

    user.reset_password_mailer = UserMailer
    user.reset_password_expiration_period = 24.hours
  end

  config.user_class = "User"
end
