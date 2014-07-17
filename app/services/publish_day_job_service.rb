class PublishDayJobService
  def initialize(day_job)
    @day_job = day_job
  end


  def publish!
    @day_job.publish!
    DayJobMailer.deliver_email_for_edit(@day_job).deliver
  end

  def send_verfication_email!
    DayJobMailer.deliver_email_for_verification(@day_job).deliver
  end
end