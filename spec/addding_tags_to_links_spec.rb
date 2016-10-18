require_relative 'spec_helper'

feature 'adding tags' do
  scenario 'addings tags to new links' do
    visit '/links/new'
    fill_in 'title', with: 'Delia Smith'
    fill_in 'url', with: 'http://http://www.deliaonline.com'
    fill_in 'tags', with: 'Food'
    click_button 'Add'
    link = Link.first
    expect(link.tags.map(&:name)).to include('Food')
  end
end
