require 'rails_helper'

RSpec.describe 'Deleting a project', type: :feature do
  scenario 'success' do
    project = FactoryBot.create(:project)
    task = FactoryBot.create(:task, project: project, title: 'Delete me') 
    
    visit project_path(project)
    expect(page).to have_content('Delete me')
    within find("#task-#{task.id}") do
      find(".edit-task-link").click
    end

    expect(page.current_path).to eq edit_project_task_path(project, task)
    click_on 'Delete Task'

    expect(page.current_path).to eq project_path(project)
    expect(page).not_to have_content('Delete me')
  end
end