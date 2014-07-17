module DayJobsHelper


 def render_day_job_title(job)
    link_to(job.title, day_job_path(job))
  end

  def render_day_job_salary(salary)

    special_label = if salary >= 6500
      "label-danger"
    elsif salary >= 3500
      "label-success"
    else
      ""
    end

    salary = number_to_currency(salary, precision: 0)

    content_tag(:span, "新台幣 #{salary} 元", :class => "label label-default #{special_label}")
  end

end
