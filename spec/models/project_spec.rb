require 'rails_helper'

RSpec.describe Project, type: :model do
  subject { Project.create(title: "June") }

  context 'all required fields are present' do
    it 'is valid' do
      expect(subject).to be_valid
    end
  end

  context 'name is missing' do
    it 'is not valid' do
      subject.update(title: '')
      expect(subject.errors).to have_key(:title)
    end
  end

	context 'name is not unique' do
    before { Project.create(title: "June")}

    it 'is not valid' do
      expect(subject.errors[:title]).to include('has already been taken')
    end
  end
end
