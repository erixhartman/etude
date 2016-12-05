class User < ApplicationRecord
  has_one :student
  has_one :teacher
  has_secure_password
end
