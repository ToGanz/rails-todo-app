require 'rails_helper'

RSpec.describe 'Creating a project', type: :feature do
  scenario 'valid inputs'  do
    visit projects_path
    fill_in 'Title', with: 'Todos for Today'
    click_on 'Create Project'
    expect(page).to have_content('Project was successfully created.')
  end

  scenario 'invalid inputs' do
    visit projects_path
    fill_in 'Title', with: ''
    click_on 'Create Project'
    expect(page).to have_content("Title can't be blank")
  end
end