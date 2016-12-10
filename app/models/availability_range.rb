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
    case t
    when 0..11
      "#{t} AM"
    when 12..23
      "#{t - 12} PM"
    end
  end

  def end_time_to_12h
    t = self.end_time
    case t
    when 0..11
      "#{t} AM"
    when 12..23
      "#{t - 12} PM"
    end
  end


end
