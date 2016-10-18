require 'spec_helper'

feature 'Adding new links' do
  scenario 'user sees a form to create a new link' do
    visit('/links/new')
    fill_in 'title', with: 'This is ZomboCom'
    fill_in 'url', with: 'http://www.zombo.com'

    click_button('Submit')

    expect(current_path).to eq '/links'

    within 'ul#links' do
      expect(page).to have_content("This is ZomboCom")
    end
  end
end
