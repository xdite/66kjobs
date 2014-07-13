class JobMailer < ActionMailer::Base

  default from: "\"66Kjobs\" #{Setting.email_sender}"

  def deliver_email_for_edit(job)
    @job = job
    mail(:to => job.email, :subject => "[66Kjobs] 感謝您在本站刊登工作！")
  end
end
