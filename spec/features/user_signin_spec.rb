require 'spec_helper'


feature 'signing in' do

let!(:user) do
  User.create(email: 'mak@on.com', password: 'abc', password_confirmation: 'abc')
end

  scenario 'a user can sign in' do
    visit('/sessions/new')
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button 'Sign in'
    expect(page).to have_content("Hello #{user.email}")
  end

  it 'does not authenticate when given an incorrect password' do
    expect(User.authenticate(user.email, 'wrong')).to be_nil
  end

end
