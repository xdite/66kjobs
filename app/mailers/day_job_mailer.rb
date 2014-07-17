class DayJobMailer < ActionMailer::Base
  default from: "\"66Kjobs\" #{Setting.email_sender}"
  
  helper JobsHelper

  def deliver_email_for_edit(day_job)
    @day_job = day_job
    mail(:to => day_job.email, :subject => "[66Kjobs] 感謝您在本站刊登工作！")
  end

  def deliver_email_for_verification(day_job)
    @day_job = day_job
    mail(:to => day_job.email, :subject => "[66Kjobs] 感謝您在本站刊登工作！請確認您的 Email")
  end


end
