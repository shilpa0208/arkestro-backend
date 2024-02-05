class Task < ApplicationRecord
    belongs_to :project
    has_many :subtasks, dependent: :destroy

    accepts_nested_attributes_for :subtasks
end
