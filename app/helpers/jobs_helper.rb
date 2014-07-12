module JobsHelper

  def render_job_title(job)
    job.title
  end


  def render_job_description(job)
    simple_format(job)
  end
end
