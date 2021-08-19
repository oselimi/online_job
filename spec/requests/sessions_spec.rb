require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  let(:user) { create(:user) }
  before { user }

  describe "GET /new" do
    it "should be logged in" do
      get "/login"
      expect(response).to have_http_status(:success)
      user_params = {
        params: {
          session: {
            email: user.email,
            password: user.password
          }
        }
      }

      post '/login', user_params
      expect(response).to redirect_to(user_path(user))
    end

    it "should be invalid logged in" do
      get "/login"
      user_params = {
        params: {
          session: {
            email: user.email,
            password: "123124"
          }
        }
      }

      post '/login', user_params
      expect(response).to redirect_to(login_path)
      expect(flash[:danger]).to eq "Invalid email/password"
    end
  end

  describe "GET /destroy" do
    it 'should be logged out' do
      delete '/logout'
      expect(response).to redirect_to(login_path)
      expect(flash[:danger]).to eq "Now you are logout"
    end
  end
end
