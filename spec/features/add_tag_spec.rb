require 'spec_helper'

feature 'Add tags to links' do

  scenario 'Adding tags to links' do
      visit '/links/new'
      fill_in 'url', with: 'http://www.kittens.com/'
      fill_in 'title', with: 'This is Kittens'
      fill_in 'tags', with: 'Action'
      click_button 'Create link'
      link = Link.first
      expect(link.tags.map(&:name)).to include('Action')
  end

end
