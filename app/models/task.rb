class Task < ApplicationRecord
  belongs_to :project
  enum status: { todo: 0, in_progess: 1, done: 2 }
  validates :name, presence: true

    # def session_duration
    #   if current_session_start.present?
    #     Time.current - current_session_start
    #   else
    #     0
    #   end
    # end

    # # Method to stop the current session and add the time to the total_time_spent
    # def stop_session
    #   if current_session_start.present?
    #     session_time = Time.current - current_session_start
    #     self.total_time_spent ||= 0
    #     update(
    #       total_time_spent: total_time_spent + session_time.to_i, # Cumul du temps total en secondes
    #       current_session_start: nil # Réinitialise la session en cours
    #     )
    #   end
    # end
end
