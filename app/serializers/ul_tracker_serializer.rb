class UlTrackerSerializer < ActiveModel::Serializer
    belongs_to :users_listing
    belongs_to :tracker

    attributes :status
end
