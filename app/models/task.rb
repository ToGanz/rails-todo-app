class Task < ApplicationRecord
  belongs_to :project
  validates :title, presence: true
  validates :project_id, presence: true

  def formatted_date
    if self.due_date
      self.due_date.strftime("%d.%m.%Y")
    end
  end
end
