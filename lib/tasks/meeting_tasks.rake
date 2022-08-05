namespace :meeting_tasks do
  desc "Remind next meeting"
  task remind_next_meeting: :environment do
    meetings_for_tomorrow = Meeting.where(start_time:1.day.from_now)
    meetings_for_tomorrow.each do |meeting|
      MeetingReminderMailer.remind_meeting(meeting).deliver!
    end
  end

  desc "Update Meeting status"
  task update_meeting_status: :environment do
    Meeting.all.each do |meeting|
      meeting.meeting_status_update unless (meeting.status =='cancled' || meeting.status == 'completed')
    end
  end
end
