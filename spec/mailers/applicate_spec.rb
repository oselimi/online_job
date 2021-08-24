require "rails_helper"

RSpec.describe ApplicateMailer, type: :mailer do
  let(:user) { create(:user) }
  let(:job) { create(:job, user: user) }
  let(:applicate) { create(:applicate, job: job) }

  describe "sent_to_user" do
    let(:mail) { ApplicateMailer.with(applicate: applicate).sent_to_user }

    it "renders the headers" do
      expect(mail.subject).to eq("New applicant in #{applicate.job.title}")
      expect(mail.to).to eq([applicate.job.user.email])
      expect(mail.from).to eq(["noreply@jobonline.com"])
    end
  end

  describe "sent_to_applicant" do
    let(:mail) { ApplicateMailer.with(applicate: applicate).sent_to_applicant }

    it "renders the headers" do
      expect(mail.subject).to eq("Successfully you apply in #{applicate.job.title} ")
      expect(mail.to).to eq([applicate.email])
      expect(mail.from).to eq(["noreply@jobonline.com"])
    end
  end
end
