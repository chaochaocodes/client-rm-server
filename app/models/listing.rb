class Listing < ApplicationRecord
    has_many :users_listings
    has_many :users, through: :users_listings

    # def self.call_api

    # end

end


