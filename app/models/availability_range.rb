class AvailabilityRange < ApplicationRecord
  belongs_to :teacher
   validates_uniqueness_of :weekday, scope: :teacher_id

  def weekday_name
    case self.weekday
    when 0
      "Sunday"
    when 1
      "Monday"
    when 2
      "Tuesday"
    when 3
      "Wednesday"
    when 4
      "Thursday"
    when 5
      "Friday"
    when 6
      "Saturday"
    end
  end

end
