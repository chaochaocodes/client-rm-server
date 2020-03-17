class UsersListingSerializer < ActiveModel::Serializer
    belongs_to :user 
    belongs_to :listing 
    has_many :ULTrackers
    has_many :trackers, through: :ULTrackers 

    attributes :id, :user_id, :listing_id
end
