class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :password,
            length: { minimum: 4 },
            if: -> { new_record? || will_save_change_to_crypted_password? }

  validates :password,
            confirmation: true,
            if: -> { new_record? || will_save_change_to_crypted_password? }

  validates :password_confirmation,
            presence: true,
            if: -> { new_record? || will_save_change_to_crypted_password? }

  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false }

  validates :username,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 20 }

  validates :display_name,
            presence: true,
            length: { maximum: 30 }

  before_validation :downcase_email
  before_validation :downcase_username

  private

  def downcase_email
    self.email = email.downcase if email.present?
  end

  def downcase_username
    self.username = username.downcase if username.present?
  end
end
