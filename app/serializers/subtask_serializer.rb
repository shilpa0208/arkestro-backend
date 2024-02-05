class SubtaskSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :due_date, :task_id
end
