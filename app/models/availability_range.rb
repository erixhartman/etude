class AvailabilityRange < ApplicationRecord
  belongs_to :teacher
  validates_uniqueness_of :weekday, scope: :teacher_id

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
