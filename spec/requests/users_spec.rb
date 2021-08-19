require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /new" do
    before {  get '/signup' }

    it "returns http success and create user" do
      expect(response).to have_http_status(:success)
      user_params = {
        params: {
          user: {
            first_name: 'Adam',
            last_name: 'John',
            email: 'john@live.com',
            password: '123456',
            password_confirmation: '123456'
          }
        }
      }
      post '/users', user_params
      expect(response).to redirect_to(assigns(:user))
      follow_redirect!
      expect(response.body).to include('Hello Adam John, successfully you create account.')
    end

    it "should invalid" do
      expect(response).to have_http_status(:success)
      user_params = {
        params: {
          user: {
            first_name: '',
            last_name: '',
            email: 'john@live.com',
            password: '123456',
            password_confirmation: '123456'
          }
        }
      }
      post '/users', user_params
      expect(response).to render_template(:new)
      expect(response).to have_http_status(:ok)
  
    end
  end
end
