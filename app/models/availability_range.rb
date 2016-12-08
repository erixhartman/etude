class AvailabilityRange < ApplicationRecord
  belongs_to :teacher

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
