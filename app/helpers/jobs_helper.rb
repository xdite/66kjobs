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

  def render_job_salary(job)
    higer_price = job.higher_bound
    special_label = if job.higher_bound > 200000
      "label-danger"
    elsif job.higher_bound > 100000
      "label-success"
    else
      ""
    end
    content_tag(:span, "新台幣 $#{job.higher_bound} 元", :class => "label label-default #{special_label}")
  end

  def render_job_fresh_state(job)
    if job.created_on == Date.today
      content_tag(:span, "NEW", :class => "label label-success")
    end


  end
end
