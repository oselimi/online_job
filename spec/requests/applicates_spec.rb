require 'rails_helper'

RSpec.describe "Applicates", type: :request do
  let(:user) { create(:user) }
  let(:job) { create(:job, user: user) }

 before do
  log_in(user)
  get job_path(job)
 end

 describe 'create applicate' do
  it 'should be create new applicate' do
   apply_params = {
    params: {
     applicate: {
      first_name: "Smith",
      last_name: "John",
      email: "john@smith.com",
      birthdate: "09-10-1994",
      phone: "+444-22-222",
      address: "New York",
      education: "Master degree"
     }
    }
   }

   post "/jobs/#{job.id}/applicates", apply_params
   expect(response).to redirect_to(root_path)
  end

  it 'should not be create new applicate' do
   apply_params = {
    params: {
     applicate: {
      first_name: "",
      last_name: "",
      email: "",
      birthdate: "",
      phone: "",
      address: "",
      education: ""
     }
    }
   }

   post "/jobs/#{job.id}/applicates", apply_params
   expect(response).to redirect_to(job_path(job))
  end
 end
end
