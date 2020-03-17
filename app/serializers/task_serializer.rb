class TaskSerializer < ActiveModel::Serializer
    belongs_to :user
    attributes :task
end
