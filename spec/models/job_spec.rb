require 'rails_helper'

RSpec.describe Job, type: :model do
  describe "relations" do
    it { should belong_to(:user) }
  end

  describe "presence validations" do 
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:category) }
    it { should validate_presence_of(:deadline) }
    it { should validate_presence_of(:user_id) }
  end
end
