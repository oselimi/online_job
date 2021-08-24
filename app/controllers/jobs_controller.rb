class JobsController < ApplicationController
  before_action :set_params, only: [:show, :edit, :update ,:destroy]
  before_action :authenticate_user, except: :show

  def index
    @jobs = Job.where(user_id: current_user)
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    @job.user = current_user
    if @job.save
      redirect_to jobs_path
      flash[:info] = "Successfully you create new job"
    else
      render :new
    end
  end

  def show
    @applicate = @job.applicates.build
  end

  def edit
  end

  def update
    if @job.update(job_params)
      redirect_to @job
      flash[:warning] = "Successfuly updated!"
    else 
      render :edit
    end
  end

  def destroy
    if @job.destroy
      redirect_to jobs_path
      flash[:danger] = "You removed job"
    end
  end

  private

  def set_params
    @job = Job.find(params[:id])
  end

  def job_params
    params.require(:job).permit(:title, :description, :category, :deadline)
  end
end
