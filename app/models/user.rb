class User < ApplicationRecord
  has_one :student
  has_one :teacher
end
