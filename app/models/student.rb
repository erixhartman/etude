class Student < ApplicationRecord
  belongs_to :user
  has_many :lessons
  has_many :teachers, through: :lessons
end
