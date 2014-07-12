class JobsController < ApplicationController


#  before_action :login_required, :only => [:create, :new, :update, :edit, :destroy]

  # GET /jobs
  # GET /jobs.json
  def index
    @jobs = Job.all
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
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

      if !@job.save
        render :new
      end
    end

  end

  def publish
    @job = Job.find_by_token(params[:id])

    @job.publish!

    redirect_to root_path
  end

  def final
    @job = Job.find_by_token(params[:token])
  end


  private


    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:title, :description, :location , :company_name, :category_id , :apply_instruction, :url, :email)
    end
  end
