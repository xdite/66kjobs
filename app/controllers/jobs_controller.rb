class JobsController < ApplicationController

  before_filter :validate_search_key , :only => [:search]
  
  def index
    @categories = Category.all
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
    @job = Job.find(params[:id])

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

  # GET /jobs/1/edit
  def edit
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

  def publish
    @job = Job.find_by_token(params[:id])


    ip_count = Job.count(:created_on => Date.today, :publish => true, :ip => request.ip )

   # if ip_count > 1
   #   flash[:error] = "一天不能張貼超過一則資訊"
   # else
      PublishJobService.new(@job).perform! 
   # end

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
end
