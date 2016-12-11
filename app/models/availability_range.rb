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

end
