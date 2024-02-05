class NestedProjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :tasks

  has_many :tasks, serializer: NestedTaskSerializer
end
