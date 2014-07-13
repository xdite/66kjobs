class PublishJobService
  def initialize(job)
    @job = job
  end


  def perform!
    @job.publish!
    JobMailer.deliver_email_for_edit(@job).deliver
  end
end