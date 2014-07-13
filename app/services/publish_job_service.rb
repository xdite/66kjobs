class PublishJobService
  def initialize(job)
    @job = job
  end


  def perform!
    @job.publish!
  end
end