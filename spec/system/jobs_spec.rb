require 'rails_helper'

RSpec.describe "Jobs", type: :system do
  let(:user) { create(:user) }
  let(:job) { create(:job, user: user) }

  before do
    driven_by(:rack_test)
    visit '/'
  end

  describe 'When user logged in' do
    before do
      login_as(user)
    end

    describe "GET/ new" do

      it "should create new job" do
        click_on "New Job"

        fill_in "Title", with: "first title"
        fill_in "Description", with: "first description"
        select  "Programming", from: "Category"
        fill_in "Deadline", with: "2021-08-21 18:21:53"

        click_on "Create Job"
        expect(page).to have_content("first title")
      end
    end

    describe 'GET/ edit' do
      before { visit(edit_job_path(job)) }
      it 'should be edited' do

        fill_in "Title", with: job.title
        fill_in "Description", with: "Second Description"
        select "Programming", from: "Category"
        fill_in "Deadline", with: "2021-09-21 18:21:53"

        click_on "Edit Job"
        expect(page).to have_content(job.title)
        expect(page).to have_content("Successfuly updated!")
      end
    end
  end
end
