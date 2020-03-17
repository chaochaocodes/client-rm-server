class User < ApplicationRecord
    has_many :tasks 
    has_many :users_listings
    has_many :listings, through: :users_listings
end
