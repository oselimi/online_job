require 'rails_helper'

RSpec.describe "Jobs", type: :request do
  let(:user) { create(:user) }
  let(:job) { create(:job, user: user) }

  before do
    log_in(user)
  end

  describe "GET /index" do
    it "returns http success" do
      get "/jobs"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
      before do
        get "/jobs/new"
      end

    it "returns http success" do

      job_params = {
        params: {
          job: {
            title: "test",
            description: "",
            category: "test",
            deadline: "12/2/2022"
          }
        }
      }

      post '/jobs', job_params
      expect(response).to render_template(:new)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/jobs/#{job.id}"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    before { get "/jobs/#{job.id}/edit" }
    it "returns http and update success" do

      job_params = {
        params: {
          job: {
            title: "Lorem Ipsum",
            description: job.description,
            category: job.category,
            deadline: job.deadline
          }
        }
      }

      patch "/jobs/#{job.id}", job_params
      expect(response).to redirect_to(assigns(:job))
      expect(flash[:warning]).to eq "Successfuly updated!"
    end
  end

  describe "GET /delete" do
    before { delete "/jobs/#{job.id}"}
    it 'should be delete job' do
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(jobs_path)
      expect(flash[:danger]).to eq "You removed job"
    end
  end

end
