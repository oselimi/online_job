class JobsController < ApplicationController
  before_action :set_params, only: [:show, :edit, :update ,:destroy]
  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    @job.user = current_user
    if @job.save
      redirect_to root_path
      flash[:info] = "Successfully you create new job"
    else
      render :new
    end
  end

  def show
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
      redirect_to root_path
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
