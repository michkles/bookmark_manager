feature 'creating links' do

  scenario 'adding site\'s address and title' do
    visit '/links/new'
    fill_in 'title', with: 'Delia Smith'
    fill_in 'url', with: 'http://www.deliasmith.com'
    click_button 'Add'
    expect(current_path).to eq '/links'
    within 'ul#links' do
      expect(page).to have_content('Title: Delia Smith')
    end
  end

end
