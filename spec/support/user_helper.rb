module UserHelper
 def log_in(user)
  user_params = {
   params: {
    session: {
     email: user.email,
     password: user.password
    }
   }
  }
  post login_path, user_params
 end

 def login_system_as(user)
  visit login_path


  fill_in 'Email',    with: user.email
  fill_in 'Password', with: user.password

  click_on 'Log'

 end
end