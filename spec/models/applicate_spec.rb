require 'rails_helper'

RSpec.describe Applicate, type: :model do
  describe "relations" do
    it { should belong_to(:job) }
  end

  describe "presence validations" do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:birthdate) }
    it { should validate_presence_of(:phone) }
    it { should validate_presence_of(:education) }
  end

  describe "format validate" do
    let(:user) { create(:user) }
    let(:job) { create(:job, user: user) }
    let(:applicate) { create(:applicate, job: job) }

    context "validate of email format" do 
      it "format should be valid" do
        addresses = %w[example@example.com e@e.com a@example.com]
        addresses.each do |valid_email|
          applicate.email = valid_email
          expect(applicate).to be_valid
        end
      end

      it "format should be invalid" do
        addresses = %w[ examle.com @example.com example@example example@example,com]
        addresses.each do |invalid_email|
          applicate.email = invalid_email
          expect(applicate).not_to be_valid
        end
      end
    end

    context "validate of phone number" do 
      it "format should be valid" do
        addresses = %w[+133-2233  +(333)3333333 0043-444-444 033333333]
        addresses.each do |valid_email|
          applicate.phone = valid_email
          expect(applicate).to be_valid
        end
      end
    end
  end
end
