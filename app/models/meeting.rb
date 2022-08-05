class Meeting < ApplicationRecord
  belongs_to :user
  enum status: { upcoming: 0, ongoing: 1, completed:2, canceled:3 }
  # after_update :meeting_status_update
  
  def upcoming?
    self.start_time > Time.zone.now
  end
  
  def ongoing?
    Time.zone.now > self.start_time && Time.zone.now < self.end_time
  end
  
  def completed?
    self.end_time < Time.zone.now
  end
  
  def update_meeting_status
    if self.upcoming?
      self.update(status:0)
    elsif self.ongoing?
      self.update(status:1) 
    elsif self.completed?
      self.update(status:2) 
    end
  end
  
  # def meeting_reminder
  #   if self.start_time == Time.zone.now..Time.zone.now + 1.hour
  #     MeetingReminderMailer.remind_meeting(self).deliver!
  #   end
  # end
end
