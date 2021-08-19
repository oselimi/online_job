require 'rails_helper'

RSpec.describe "Users", type: :system do
  before do
    driven_by(:rack_test)
    visit '/signup'
  end

  describe 'Create new account' do
    it 'should be valid' do 
      fill_in 'First name', with: 'Adam'
      fill_in 'Last name', with: 'John'
      fill_in 'Email', with: 'jon@live.com'
      fill_in 'Password', with: '123456'
      fill_in 'Password confirmation', with: '123456'

      click_on 'Submit'

      expect(page).to have_content('Adam John')
      expect(page).to have_content("Hello Adam John, successfully you create account.")
    end
  end

  it 'should be invalid' do 
    fill_in 'First name', with: 'Adam'
    fill_in 'Last name', with: ''
    fill_in 'Email', with: 'john@live.com'
    fill_in 'Password', with: '123'
    fill_in 'Password confirmation', with: '123'

    click_on 'Submit'
    
    expect(page).to have_content("Last name can't be blank")
    expect(page).to have_content("Password is too short (minimum is 6 characters)")
  end
end
