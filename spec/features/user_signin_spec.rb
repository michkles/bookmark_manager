require 'spec_helper'

feature 'User sign in' do
  def sign_in_fail
    visit '/users/new'
    expect(page.status_code).to eq 200
    fill_in :email, with: 'michal@gmail.com'
    fill_in :password, with: 'password'
    fill_in :password_confirmation, with: 'pazzword'
    click_button 'Register'
  end

  scenario 'password must match' do
    sign_in_fail
    expect { sign_in_fail }.not_to change(User, :count)
  end

  scenario 'if passwords do not match' do
    sign_in_fail
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Password and confirmation password do not match'
  end

  scenario 'if email is not filled in ' do
    def no_email
      visit '/users/new'
      expect(page.status_code).to eq 200
      fill_in :email, with: ''
      fill_in :password, with: 'password'
      fill_in :password_confirmation, with: 'password'
      click_button 'Register'
    end
    expect { no_email }.not_to change(User, :count)
  end


  scenario 'if email is not valid' do
    def invalid_email
      visit '/users/new'
      expect(page.status_code).to eq 200
      fill_in :email, with: 'blabla@bla'
      fill_in :password, with: 'password'
      fill_in :password_confirmation, with: 'password'
      click_button 'Register'
    end
    expect { invalid_email }.not_to change(User, :count)
  end


end
