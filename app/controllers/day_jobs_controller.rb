class DayJobsController < ApplicationController

  def index
    @day_jobs = DayJob.all
  end



  # GET /day_jobs/new
  def new
    if params[:token].present?
      @day_job = DayJob.where(:token => params[:token]).first

      if @day_job.blank?
        @day_job = DayJob.new
      end

    else
      @day_job = DayJob.new
    end
  end

  def preview


    if params[:day_job][:token].present?
      @day_job = DayJob.find_by_token(params[:day_job][:token])
      if @day_job.update(day_job_params)
        render :preview
      else
        render :new
      end
    else

      @day_job = DayJob.new(day_job_params)
      @day_job.ip = request.remote_ip

      if !@day_job.save
        render :new
      end
    end


  end

  def edit
  end


  def final
    @day_job = DayJob.find_by_token(params[:token])
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def day_job_params
      params.require(:day_job).permit(:lower_bound, :higher_bound, :title, :description, :location , :company_name, :category_id , :apply_instruction, :url, :email)
   end
end
