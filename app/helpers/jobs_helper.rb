module JobsHelper

  def render_job_title(job)
    link_to(job.title, job_path(job))
  end


  def render_job_description(job)
    simple_format(job)
  end

  def render_job_url(job)
    link_to(job.url, job.url) 
  end
end
