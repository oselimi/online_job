require 'rails_helper'

RSpec.describe "Statics", type: :system do
  before do
    driven_by(:rack_test)
  end

  let(:user) { create(:user) }
  let(:job) { create(:job, user: user) }

  describe 'staic page' do
    before { visit root_path }
    it "should be valid" do
     expect(page).to have_link('Home')
     expect(page).to have_link('Login')
    end
  end
end
