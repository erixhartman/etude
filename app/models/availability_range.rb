class AvailabilityRange < ApplicationRecord
  belongs_to :teacher
  validates_uniqueness_of :weekday, scope: :teacher_id
  validate :start_time_before_end_time

  def start_time_before_end_time
    unless self.start_time < self.end_time
      errors.add(:end_time, "Your end time must be later than your start time")
    end
  end

  def start_time_to_12h
    t = self.start_time
    time_12h(t)
  end

  def end_time_to_12h
    t = self.end_time
    time_12h(t)
  end

  def time_12h(t)
    case t
    when 0
      "12 AM"
    when 1..11
      "#{t} AM"
    when 12
      "12 PM"
    when 13..23
      "#{t - 12} PM"
    end
  end

  HOURS_OF_DAY =
  {"12 AM" => 0, 
    "1 AM" => 1,
    "2 AM" => 2,
    "3 AM" => 3,
    "4 AM" => 4,
    "5 AM" => 5,
    "6 AM" => 6,
    "7 AM" => 7,
    "8 PM" => 8,
    "9 AM" => 9,
    "10 AM" => 10,
    "11 AM" => 11,
    "12 PM" => 12,
    "1 PM" => 13 ,
    "2 PM" => 14,
    "3 PM" => 15,
    "4 PM" => 16,
    "5 PM" => 17,
    "6 PM" => 18,
    "7 PM" => 19,
    "8 PM" => 20,
    "9 PM" => 21,
    "10 PM" => 22,
    "11 PM" => 23
  }

end
