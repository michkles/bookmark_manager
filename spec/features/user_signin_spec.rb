require 'spec_helper'

feature 'User sign in' do
  scenario 'password must match' do
    def sign_in_fail
      visit '/users/new'
      expect(page.status_code).to eq 200
      fill_in :email, with: 'michal@gmail.com'
      fill_in :password, with: 'password'
      fill_in :password_confirm, with: 'pazzword'
      click_button 'Register'
    end
    expect { sign_in_fail }.not_to change(User, :count)

  end
end
