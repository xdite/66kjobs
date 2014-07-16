class PublishJobService
  def initialize(job)
    @job = job
  end


  def publish!
    @job.publish!
    JobMailer.deliver_email_for_edit(@job).deliver
  end

  def send_verfication_email!
    JobMailer.deliver_email_for_verification(@job).deliver
  end
end