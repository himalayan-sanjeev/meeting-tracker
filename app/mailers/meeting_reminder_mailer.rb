class MeetingReminderMailer < ApplicationMailer
  default from: 'no-reply@meromeeting.com'

  def remind_meeting(meeting)
    @meeting = meeting
    mail(to: @meeting.user.email, subject: "Meeting Reminder!")
  end
end
