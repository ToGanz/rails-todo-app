class RenameDueDateToDueDate < ActiveRecord::Migration[6.1]
  def change
    rename_column :tasks, :dueDate, :due_date
  end
end
