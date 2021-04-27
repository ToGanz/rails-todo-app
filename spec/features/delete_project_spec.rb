require 'rails_helper'

RSpec.describe 'Deleting a project', type: :feature do
  scenario 'success' do
    Project.create(title: 'Start a blog')
    visit projects_path
    expect(page).to have_content('Start a blog')
    click_on 'x'
    expect(page).not_to have_content('Start a blog')
  end
end