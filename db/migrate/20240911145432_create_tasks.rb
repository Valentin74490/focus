class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :name, null: false
      t.text :description
      t.integer :status, default: 0, null: false
      t.timestamp :time_task

      t.timestamps
    end
  end
end
