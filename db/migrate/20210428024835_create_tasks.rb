class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.date :dueDate
      t.integer :priority
      t.text :description
      t.references :project, null: false, foreign_key: true
      t.boolean :completed,  default: false

      t.timestamps
    end
  end
end
