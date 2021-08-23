class ApplicatesController < ApplicationController

  def create
    @job = Job.find(params[:job_id])
    @applicate = @job.applicates.build(apply_params)
    if @applicate.save
      redirect_to root_path
      flash[:success] = "Thank you for apply"
      ApplicateMailer.with(applicate: @applicate).sent_to_user.deliver_later
      ApplicateMailer.with(applicate: @applicate).sent_to_applicant.deliver_later
    else
      redirect_to job_path(@job)
    end
  end

  private

  def apply_params
    params.require(:applicate).permit(:first_name, :last_name, :email, :phone, :birthdate, :education, :address, :avatar)
  end
end
