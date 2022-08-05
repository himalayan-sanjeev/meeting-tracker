class Meeting < ApplicationRecord
  belongs_to :user

  enum status: { upcoming: 0, ongoing: 1, completed:2, cancled:3 }

  def upcoming?
    self.start_time > DateTime.now
  end

  def ongoing?
    DateTime.now > self.start_time && DateTime.now < self.end_time
  end

  def completed?
    self.end_time < DateTime.now
  end
  
  def meeting_status_update
    self.update(status:0) if self.upcoming?
    self.update(status:1) if self.ongoing?
    self.update(status:2) if self.completed?
  end
end
