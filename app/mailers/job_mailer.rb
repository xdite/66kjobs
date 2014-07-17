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
    start_date = Date.today - 2.days
    end_date = Date.today
    @jobs = Job.published.where(:created_on => (start_date..end_date)).order("id DESC").limit(20)
    @title = "66K+ 工作速報 : #{start_date} ~ #{end_date} "
    mail(:to => email, :subject => @title )
  end


end
