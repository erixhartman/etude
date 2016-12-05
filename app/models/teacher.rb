class Teacher < ApplicationRecord
  belongs_to :user
  has_many :lessons
  has_many :students, through: :lessons
end
