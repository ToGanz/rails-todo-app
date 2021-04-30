require 'rails_helper'

RSpec.describe 'Creating a task', type: :feature do
  let(:project) { FactoryBot.create(:project) }

  scenario 'valid inputs' do
    visit project_path(project)
    fill_in 'Title', with: 'Groceries'
    fill_in 'Due date', with: Date.today
    fill_in 'Priority', with: 4
    fill_in 'Description', with: 'Buy Bananas'
    click_on 'Add Task'

    expect(page).to have_content('Task was successfully created.')
    expect(page).to have_content('Groceries')
  end

  scenario 'invalid inputs' do
    visit project_path(project)
    fill_in 'Title', with: ''
    fill_in 'Due date', with: Date.today
    fill_in 'Priority', with: 4
    fill_in 'Description', with: 'Buy Bananas'
    click_on 'Add Task'
    expect(page).to have_content("Title can't be blank")
    expect(page).not_to have_content('Groceries')
  end

end