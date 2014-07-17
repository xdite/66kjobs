class DayJobsController < ApplicationController

  def index
    @day_jobs = DayJob.published
    set_page_title "日薪專區"
  end


  def show
    @day_job = DayJob.published.find(params[:id])

    set_page_title @day_job.og_title
    set_page_description @day_job.og_description
  end



  def edit
    @day_job = DayJob.find_by_token(params[:id])
  end

  def update
    @day_job = DayJob.find_by_token(params[:id])
    if @day_job.update(day_job_params_for_edit)
      flash[:notice] = "修改成功"
      redirect_to day_job_path(@day_job)
    else
      render :new
    end
  end

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


  def publish
    @day_job = DayJob.find_by_token(params[:id])

    flash[:notice] = "感謝您刊登此資訊，我們會寄一封信件到您信箱確認您刊登 email 有效，等您驗證過後，職缺會立即刊登"
    PublishDayJobService.new(@day_job).send_verfication_email!

    redirect_to root_path

  end

  def verify
    @day_job = DayJob.find_by_token(params[:id])

    if @day_job.verified?
      flash[:error] = "你已經驗證過了"
      redirect_to root_path
    else
      @day_job.verify!
      PublishDayJobService.new(@day_job).publish! 
      flash[:notice] = "驗證通過。您的職缺已順利刊登！"
      redirect_to day_job_path(@day_job)
    end
  end

  def final
    @day_job = DayJob.find_by_token(params[:token])
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def day_job_params
      params.require(:day_job).permit(:lower_bound, :higher_bound, :title, :description, :location , :company_name, :category_id , :apply_instruction, :url, :email)
   end

    def day_job_params_for_edit
    params.require(:day_job).permit(:is_published,:lower_bound, :higher_bound, :title, :description, :location , :company_name, :category_id , :apply_instruction, :url, :email)
  end
end
