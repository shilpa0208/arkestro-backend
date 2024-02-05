class CreateSubtasks < ActiveRecord::Migration[7.1]
  def change
    create_table :subtasks do |t|
      t.references :task, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.date :due_date

      t.timestamps
    end
  end
end
