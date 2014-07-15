module JobsHelper

  def render_job_title(job)
    link_to(job.title, job_path(job))
  end


  def render_job_description(job)
    sanitize(job.description.to_markdown)
  end


  def render_job_apply_instruction(job)
    job.apply_instruction.to_markdown
  end

  def render_job_url(job)
    link_to(job.url, job.url) 
  end

  def render_job_salary(salary)

    special_label = if salary >= 200000
      "label-danger"
    elsif salary >= 100000
      "label-success"
    else
      ""
    end

    salary = number_to_currency(salary, precision: 0)

    content_tag(:span, "新台幣 $#{salary} 元", :class => "label label-default #{special_label}")
  end

  def render_job_fresh_state(job)
    if job.created_on >= Date.today - 1.days
      content_tag(:span, "NEW", :class => "label label-success")
    end


  end

  def render_job_company_name(job)
    if job.url.present?
      link_to(job.company_human_name, job.url, :target => "_blank")
    else
      job.company_human_name
    end
  end
end
