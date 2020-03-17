class TrackerSerializer < ActiveModel::Serializer
    has_many :ULTrackers
    attributes :stage
end
