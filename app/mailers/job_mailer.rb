class JobMailer < ActionMailer::Base

  default from: "\"66Kjobs\" #{Setting.email_sender}"
  
  helper JobsHelper

  def deliver_email_for_edit(job)
    @job = job
    mail(:to => job.email, :subject => "[66Kjobs] 感謝您在本站刊登工作！")
  end

  def deliver_email_for_verification(job)
    @job = job
    mail(:to => job.email, :subject => "[66Kjobs] 感謝您在本站刊登工作！請確認您的 Email")
  end

  def job_list_summary(email)
    @jobs = Job.published.where(:created_on => (Date.today - 2.days)..Date.today ).order("id DESC").limit(20)
    mail(:to => email, :subject => "xxx")
  end


end
