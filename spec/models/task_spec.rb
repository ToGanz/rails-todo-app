require 'rails_helper'

RSpec.describe Task, type: :model do
  subject { FactoryBot.create(:task) }

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
