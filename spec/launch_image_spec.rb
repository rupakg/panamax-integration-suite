require 'spec_helper.rb'

describe 'Launch an image' do
  it 'allows users to search for an image term' do
    visit('/')

    within 'li.search-link' do
      click_on('Search')
    end

    expect(current_path).to eq('/search/new')

    fill_in 'search_form_query', with: 'ubuntu'
  end

  it 'allows users to launch an image' do

    within 'div.search-result-item.image-result', text: 'Official Ubuntu base image' do
      expect(page).to have_content "ubuntu"
      click_on('Run Image')
    end

    expect(page).to have_content 'ubuntu'
  end
end
