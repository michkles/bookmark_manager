require 'spec_helper'

feature 'List of Links on Bookmark Manager' do
  scenario 'user can see list of links on homepage' do
    Link.create(url: 'http://www.teamtreehouse.com', title: 'Team Treehouse')
    visit('/links')
    
    expect(page.status_code).to eq 200

    within 'ul#links' do
      expect(page).to have_content('Team Treehouse')
    end
  end
end
