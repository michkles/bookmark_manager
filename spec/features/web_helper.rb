def sign_up
  visit '/users/new'
  expect(page.status_code).to eq 200
  fill_in :email, with: 'michal@gmail.com'
  fill_in :password, with: 'password'
  fill_in :password_confirmation, with: 'password'
  click_button 'Register'
end
