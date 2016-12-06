class Lesson < ApplicationRecord
  belongs_to :teacher
  belongs_to :student

  validates :time, allow_blank: false, presence: true
  # validate :teacher_must_be_available
  # validate :date_cannot_be_in_the_past

  # def teacher_must_be_available
  #   if teacher.available?(time)
  #     # To Do Add Errors
  #     puts "****************OK"
  #   else
  #     puts "****************ERROR"
  #   end
  # end
  #
  # def date_cannot_be_in_the_past
  #   if time.present? && time < Time.now
  #
  #   end
  # end

end
