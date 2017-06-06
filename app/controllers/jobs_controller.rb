class JobsController < ApplicationController
  before_action :set_company, only: [:index, :new, :create]
  def index
    @jobs = @company.jobs
  end

  def new
    @job = Job.new()
  end

  def create
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  def show
    @job = Job.find(params[:id])
  end

  def edit
    # implement on your own!
  end

  def update
    # implement on your own!
  end

  def destroy
    # implement on your own!
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city)
  end

  def set_company
    @company = Company.find(params[:company_id])
  end
end
