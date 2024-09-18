class Task < ApplicationRecord
  belongs_to :project
  enum status: { todo: 0, in_progess: 1, done: 2 }
  validates :name, presence: true
end
