Rails.application.config.sorcery.submodules =
  [:brute_force_protection, :reset_password, :remember_me]

Rails.application.config.sorcery.configure do |config|

  config.user_config do |user|
    user.stretches = 1 if Rails.env.test?

    user.downcase_username_before_authenticating = true

    user.lock_strategy = :failed_attempts
    user.unlock_strategy = :time
    user.unlock_time_period = 1.hour
    user.max_failed_logins = 5

    user.reset_password_mailer = UserMailer
    user.reset_password_expiration_period = 24.hours

    user.remember_me_token_expires_at = 2.weeks.from_now
  end

  config.user_class = "User"
end
