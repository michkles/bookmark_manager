feature 'adding user accounts' do

  scenario 'signing up' do
      visit('/register')

      fill_in 'first_name', with: 'Mike'
      fill_in 'last_name', with: 'Like'
      fill_in 'email', with: 'mike@gmail.com'
      fill_in 'password', with: 'qwerty'
      click_button('Register')
      User.inspect
      expect { User.count }.to change.by(1)
      expect(page).to have_path '/welcome'
      expect(page).to have_content 'Welcome new user'
  end

end
