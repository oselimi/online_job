# Preview all emails at http://localhost:3000/rails/mailers/applicate
class ApplicatePreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/applicate/sent_to_user
  def sent_to_user
    ApplicateMailer.with(job: Job.first).sent_to_user
  end

  # Preview this email at http://localhost:3000/rails/mailers/applicate/sent_to_applicant
  def sent_to_applicant
    ApplicateMailer.with(applicate: Applicate.first).sent_to_applicant
  end

end
