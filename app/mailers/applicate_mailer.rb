class ApplicateMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.applicate_mailer.sent_to_user.subject
  #
  def sent_to_user
    @applicate = params[:applicate]
    @root = 'http://localhost:3000/jobs'
    mail to: @applicate.job.user.email, subject: "New applicant in #{@applicate.job.title}"
  end

 
  def sent_to_applicant
    @applicate = params[:applicate]

    mail to: @applicate.email, subject: "Successfully you apply in #{@applicate.job.title} "
  end
end
