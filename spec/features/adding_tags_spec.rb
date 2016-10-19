require 'spec_helper'

feature 'I want to add a single tag to a link' do
  scenario 'adding a tag' do
    visit('/links/new')
    fill_in 'title', with: 'This is ZomboCom'
    fill_in 'url', with: 'http://www.zombo.com'
    fill_in 'tags', with: 'zombo'
    click_button('Submit')

    link = Link.first
    expect(link.tags.map(&:name)).to include('zombo')
  end
end
