class Teacher < ApplicationRecord
  belongs_to :user
  has_many :lessons
  has_many :availability_ranges
  has_many :students, through: :lessons

  validates :subject, :postal_code, :bio, :picture, :teaching_since, :street_address, :city, :province, presence: true
  validates :price, numericality: {only_integer: true}

  def first_name
    User.find(self.user_id).first_name
  end

  def last_name
    User.find(self.user_id).last_name
  end

  def email
    User.find(self.user_id).email
  end

  def availability_ok?(date)
    weekday = date.wday
    hour = date.hour
    self.availability_ranges.each do |a|
      if a.weekday == weekday && a.start_time <= hour && a.end_time > hour
        return true
      end
    end
    return false
  end

  def available?(time)
    if lessons.length > 0
      lessons.each do |l|
        if l.time == time
          return false
        end
      end
    end
    return true
  end
end
