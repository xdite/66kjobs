class DayJobsController < ApplicationController
  before_action :set_day_job, only: [:show, :edit, :update, :destroy]

  # GET /day_jobs
  # GET /day_jobs.json
  def index
    @day_jobs = DayJob.all
  end

  # GET /day_jobs/1
  # GET /day_jobs/1.json
  def show
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

  # GET /day_jobs/1/edit
  def edit
  end

  # POST /day_jobs
  # POST /day_jobs.json
  def create
    @day_job = DayJob.new(day_job_params)

    respond_to do |format|
      if @day_job.save
        format.html { redirect_to @day_job, notice: 'Day job was successfully created.' }
        format.json { render :show, status: :created, location: @day_job }
      else
        format.html { render :new }
        format.json { render json: @day_job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /day_jobs/1
  # PATCH/PUT /day_jobs/1.json
  def update
    respond_to do |format|
      if @day_job.update(day_job_params)
        format.html { redirect_to @day_job, notice: 'Day job was successfully updated.' }
        format.json { render :show, status: :ok, location: @day_job }
      else
        format.html { render :edit }
        format.json { render json: @day_job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /day_jobs/1
  # DELETE /day_jobs/1.json
  def destroy
    @day_job.destroy
    respond_to do |format|
      format.html { redirect_to day_jobs_url, notice: 'Day job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_day_job
      @day_job = DayJob.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def day_job_params
      params.require(:day_job).permit(:title, :description)
    end
end
