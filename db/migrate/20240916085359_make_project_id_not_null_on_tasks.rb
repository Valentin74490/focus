class MakeProjectIdNotNullOnTasks < ActiveRecord::Migration[7.1]
  def change
    change_column_null :tasks, :project_id, false
  end
end
