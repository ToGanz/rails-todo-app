require 'rails_helper'

RSpec.describe Task, type: :model do
  let(:project) { Project.create(title: "Week 27") }
  subject do 
    Task.create(
      title: "Buy Groceries", 
      project: project, 
      due_date: "27.05.2021",
      priority:  5,
      description: "Get bananas and apples"
    )
  end

  context 'all required fields are present' do
    it 'is valid' do
      expect(subject).to be_valid
    end
  end

  context 'title is missing' do
    it 'is not valid' do
      subject.update(title: '')
      expect(subject.errors).to have_key(:title)
    end
  end

  context 'project is missing' do
    it 'is not valid' do
      subject.update(project: nil)
      expect(subject.errors).to have_key(:project)
    end
  end

end
