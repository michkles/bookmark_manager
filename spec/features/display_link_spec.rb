require 'spec_helper'

feature 'Display links' do
  scenario 'User can view links on the page' do
    Link.create(url: 'localhost:4567', title: 'Bookmark Manager')
    visit '/links'
    expect(page.status_code).to eq 200
    within 'ul#links' do
      expect(page).to have_content('Bookmark Manager')
    end
  end
end
