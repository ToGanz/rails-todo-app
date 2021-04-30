require 'rails_helper'

RSpec.describe 'Update task', type: :feature do

  scenario 'valid inputs' do
    project = FactoryBot.create(:project)
    task = FactoryBot.create(:task, project: project) 

    visit project_path(project)
    within find("#task-#{task.id}") do
      find(".edit-task-link").click
    end
    expect(page.current_path).to eq edit_project_task_path(project, task)

    fill_in 'Title', with: 'Locations'
    click_on 'Update Task'
    expect(page.current_path).to eq project_path(project)

    expect(page).to have_content('Locations')
  end

  scenario 'mark as complete' do
    project = FactoryBot.create(:project)
    task = FactoryBot.create(:task, project: project) 

    visit project_path(project)
    within find("#task-#{task.id}") do
      click_on 'completed?'
    end

    expect(task.reload.completed).to be true
    within find("#task-#{task.id}") do
      click_on 'completed!'
    end
    expect(task.reload.completed).to be false
  end
end