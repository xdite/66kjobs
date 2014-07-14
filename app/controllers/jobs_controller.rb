class JobsController < ApplicationController

  before_filter :validate_search_key , :only => [:search]
  
  def index
    @categories = Category.all
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
    @job = Job.published.find(params[:id])

    set_page_title @job.og_title
    set_page_description @job.og_description
  end


  # GET /jobs/new
  def new
    if params[:token].present?
      @job = Job.where(:token => params[:token]).first

      if @job.blank?
        @job = Job.new
      end

    else
      @job = Job.new
    end
  end




  def preview

    if params[:job][:token].present?
      @job = Job.find_by_token(params[:job][:token])
      if @job.update(job_params)
        render :preview
      else
        render :new
      end
    else

      @job = Job.new(job_params)
      @job.ip = request.remote_ip

      if !@job.save
        render :new
      end
    end

  end

  def edit
    @job = Job.find_by_token(params[:id])
  end

  def update
    @job = Job.find_by_token(params[:id])
    if @job.update(job_params_for_edit)
      flash[:notice] = "修改成功"
      redirect_to job_path(@job)
    else
      render :new
    end
  end


  def publish
    @job = Job.find_by_token(params[:id])


    ip_count = Job.where(:created_on => Date.today, :is_published => true, :ip => request.ip ).count

    if ip_count > 1
      flash[:error] = "一天不能張貼超過一則資訊"
    else
      PublishJobService.new(@job).perform! 
    end

    redirect_to root_path
  end

  def final
    @job = Job.find_by_token(params[:token])
  end


  def search
    if @query_string.present?
      search_result = Job.ransack(@search_criteria).result(:distinct => true)
      @jobs = search_result.paginate(:page => params[:page], :per_page => 20 )
      set_page_title "搜尋 #{@query_string}"
    end
  end
  

  protected

  def validate_search_key
    @query_string = params[:q].gsub(/\\|\'|\/|\?/, "") if params[:q].present?
    @search_criteria = search_criteria(@query_string)
  end


  def search_criteria(query_string)
    { :title_or_description_or_email_or_location_cont => query_string }
  end




  # Never trust parameters from the scary internet, only allow the white list through.
  def job_params
    params.require(:job).permit(:lower_bound, :higher_bound, :title, :description, :location , :company_name, :category_id , :apply_instruction, :url, :email)
  end

  def job_params_for_edit
    params.require(:job).permit(:is_published,:lower_bound, :higher_bound, :title, :description, :location , :company_name, :category_id , :apply_instruction, :url, :email)
  end
end
