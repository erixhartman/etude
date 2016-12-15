class Lesson < ApplicationRecord
  belongs_to :teacher
  belongs_to :student

  validates :time, allow_blank: false, presence: true
  validates :format, presence: true

  validate :lesson_active, on: :create
  validate :teacher_must_be_available, on: :create
  validate :teacher_must_be_generally_available, on: :create

  def teacher_must_be_available
    unless teacher.available?(time)
      errors.add(:time, "Teacher is not available at this time")
    end
  end


  def teacher_must_be_generally_available
    unless teacher.availability_ok?(time)
      errors.add(:time, "Teacher does not teach during these hours")
    end
  end



  def lesson_active
    if self.time != nil
      unless Time.now < self.time
        errors.add(:time, 'You must book in the future')
      end
    end
  end

end
