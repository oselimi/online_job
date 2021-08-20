require 'rails_helper'

RSpec.describe "Jobs", type: :request do
  let(:user) { create(:user) }
  let(:job) { create(:job, user: user) }

  describe "GET /index" do
    it "returns http success" do
      get "/"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
      before do
        get "/jobs/new"
        user
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
      expect(response).to have_http_status(:success)

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
    end
  end

end
