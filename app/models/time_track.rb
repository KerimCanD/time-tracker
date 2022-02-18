class TimeTrack < ApplicationRecord
  belongs_to :user
  validate :check_start_and_end
  
  def check_start_and_end
    if time_started > time_ended
      errors.add(:time_started, 'must be smaller than end date')
    end
  end
end
