class User < ApplicationRecord
  has_one :student
  has_one :teacher
  has_secure_password
  before_save :lowercase_email

  validates :first_name, :last_name, :password_confirmation, presence: true
  validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

  def lowercase_email
    self.email = self.email.downcase
  end

end
