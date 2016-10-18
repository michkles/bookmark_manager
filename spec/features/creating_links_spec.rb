require 'spec_helper'

feature 'Adding links' do

  scenario 'it adds links to the page' do
    visit '/links/new'
    fill_in 'url', with: 'http://www.kittens.com/'
    fill_in 'title', with: 'This is Kittens'
    click_button 'Create link'

    expect(current_path).to eq '/links'

    within 'ul#links' do
      expect(page).to have_content('This is Kittens')
    end
  end
end
