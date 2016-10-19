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

  before(:each) do
    Link.create(url: 'http://www.bbc.com', title: 'BBC', tags: [Tag.first_or_create(name: 'news')])
    Link.create(url: 'http://www.yahoo.com', title: 'Yahoo', tags: [Tag.first_or_create(name: 'browsers')])
    Link.create(url: 'http://www.westham.com', title: 'Hammers', tags: [Tag.first_or_create(name: 'bubbles')])
    Link.create(url: 'http://www.bubblebath.com', title: 'Bubble Bath', tags: [Tag.first_or_create(name: 'bubbles')])
  end

  scenario 'Filter links by tag' do
    visit '/tags/bubbles'
    expect(page.status_code).to eq(200)
    within 'ul#links' do
      expect(page).not_to have_content('BBC')
      expect(page).not_to have_content('Yahoo')
      expect(page).to have_content('Hammers')
      expect(page).to have_content('Bubble Bath')
    end
  end
end
