class Project < ApplicationRecord
  has_many :tasks
  validates :title, presence: true, uniqueness: true
end
