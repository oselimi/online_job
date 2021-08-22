require "rails_helper"

RSpec.describe ApplicateMailer, type: :mailer do
  describe "sent_to_user" do
    let(:mail) { ApplicateMailer.sent_to_user }

    it "renders the headers" do
      expect(mail.subject).to eq("Sent to user")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

  describe "sent_to_applicant" do
    let(:mail) { ApplicateMailer.sent_to_applicant }

    it "renders the headers" do
      expect(mail.subject).to eq("Sent to applicant")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
