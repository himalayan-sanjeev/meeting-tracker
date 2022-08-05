namespace :meeting_tasks do
  desc "Remind Next Meeting"
  task remind_next_meeting: :environment do
    meetings_for_next_hour = Meeting.where(start_time:Time.zone.now..Time.zone.now + 1.hour) #meetings within an hour
    meetings_for_next_hour.each do |meeting|
      MeetingReminderMailer.remind_meeting(meeting).deliver!
    end
  end

  desc "Update Meeting Status"
  task update_meeting_status: :environment do
    Meeting.all.each do |meeting|
      meeting.update_meeting_status
       unless (meeting.status =='canceled' || meeting.status == 'completed')
    end
  end
end
end