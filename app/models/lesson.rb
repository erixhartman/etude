class Lesson < ApplicationRecord
  belongs_to :teacher
  belongs_to :student

  validates :time, allow_blank: false, presence: true
  validate :lesson_active, on: :create

  # def teacher_must_be_available
  #   if teacher.available?(time)
  #     # To Do Add Errors
  #     puts "****************OK"
  #   else
  #     puts "****************ERROR"
  #   end
  # end

  def lesson_active
    if self.time != nil
      unless Time.now < self.time
        errors.add(:time, 'You must book in the future')
      end
    end
  end

end
