class UsersListing < ApplicationRecord
    belongs_to :user 
    belongs_to :listing 
    has_many :ULTrackers
    has_many :trackers, through: :ULTrackers 
end
