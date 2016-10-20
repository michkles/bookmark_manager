require 'spec_helper'

feature 'User sign in' do

  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Hello michal@gmail.com')
    expect(User.first.email).to eq('michal@gmail.com')
  end

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
    expect(page).to have_content 'Password does not match the confirmation'
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

  scenario 'user cannot sign up twice' do
    sign_up
    expect { sign_up }.not_to change(User, :count)
    expect(page).to have_content 'Email is already taken'
  end

end
