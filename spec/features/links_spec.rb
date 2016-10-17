require 'spec_helper'

feature 'view links' do
  scenario 'display list of links' do
    Link.create(
    :url => "www.bbc.co.uk/news" ,
    :title => "Interesting webpage" )
    visit ('/')
    expect(page.status_code).to eq 200
    within 'ul#links' do
      expect(page).to have_content "Interesting webpage"
    end
  end
end
