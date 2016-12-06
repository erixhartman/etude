class Teacher < ApplicationRecord
  belongs_to :user
  has_many :lessons
  has_many :students, through: :lessons

  def first_name
    User.find(self.user_id).first_name
  end

  def last_name
    User.find(self.user_id).last_name
  end

  def email
    User.find(self.user_id).email
  end

end
