class Listing < ApplicationRecord
    has_many :users_listings
    has_many :users, through: :users_listings
end
