class AddTimeTrackingToTasks < ActiveRecord::Migration[7.1]
  def change
    add_column :tasks, :current_session_start, :datetime
    add_column :tasks, :total_time_spent, :integer
  end
end
