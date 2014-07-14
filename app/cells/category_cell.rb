class CategoryCell < Cell::Rails

  append_view_path("app/views")

  helper JobsHelper

  def jobs(args)
    @category = args[:category]
    @jobs = @category.jobs.published.recent

    render 
  end
end
