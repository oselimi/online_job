require 'rails_helper'

RSpec.describe "Jobs" do
  
  before do
    driven_by(:rack_test)
  end
  
  let(:user) { create(:user) }
  let(:job) { create(:job, user: user) }


  describe 'when user logged in' do
    before do 
      login_system_as(user)
      visit '/'
    end

    describe 'GET/ index' do
      it 'showing my jobs page' do
        click_on 'My Jobs'

        expect(page).to have_content('My Jobs and Applicants')
        if expect(job.deadline).to be > Date.today
          expect(job.title).to eq "Title of job"
          expect(job.deadline).to eq "2022-08-21 18:21:53"
        end
      end
    end

    describe 'GET/ new' do
      it 'should create new job' do
        click_on 'New Job'

        fill_in 'Title', with: 'first title'
        fill_in 'Description', with: 'first description'
        select  'Programming', from: 'Category'
        fill_in 'Deadline', with: '2021-08-21 18:21:53'

        click_on 'Create Job'
        expect(page).to have_content('first title')
      end
    end

    describe 'GET/ edit' do
      it 'should be edited' do
        visit edit_job_path(job)

        fill_in 'Title', with: job.title
        fill_in 'Description', with: 'last description'
        select  'Programming', from: 'Category'
        fill_in 'Deadline', with: '2022-08-21 18:21:53'

        click_on 'Edit Job'
        expect(page).to have_content("Successfuly updated!")
      end
    end
  end
end
