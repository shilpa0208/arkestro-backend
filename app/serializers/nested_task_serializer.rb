class NestedTaskSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :subtasks

  has_many :subtasks, serializer: NestedSubtaskSerializer
end
