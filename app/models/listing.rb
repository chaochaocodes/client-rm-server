class Listing < ApplicationRecord
    has_many :users_listings
    has_many :users, through: :users_listings

    
    # def search_by_city
    #     URL="https://realtor.p.rapidapi.com/properties/list-for-sale"
        
    # end
end


