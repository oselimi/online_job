require 'rails_helper'

RSpec.describe User, type: :model do

  describe "relations" do
    it { should have_many(:jobs).dependent(:destroy) }
  end

  describe "presence validations" do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
  end

  describe "formats of emails, email before save downcase and password length" do
    let(:user) { create(:user) }

    it "format should be valid" do
      addresses = %w[example@example.com e@e.com a@example.com]
      addresses.each do |valid_email|
        user.email = valid_email
        expect(user).to be_valid
      end
    end

    it "format should be invalid" do
      addresses = %w[ examle.com @example.com example@example example@example,com]
      addresses.each do |invalid_email|
        user.email = invalid_email
        expect(user).not_to be_valid
      end
    end
  end

  it { should validate_length_of(:password).is_at_least(User::MIN_LENGTH_PASSWORD) }
  it { should have_secure_password }

  context "email downcase" do 
    let(:user) { create(:user, email: "EXAMPLE@EXAMPLE.COM") }

    it 'email should be downcase before save' do
      expect(user.email).to eq 'example@example.com'
    end
  end
end
