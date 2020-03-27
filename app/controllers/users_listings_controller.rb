class UsersListingsController < ApplicationController
    def save_listing
        listing = Listing.find_or_create_by(city_state: params["city_state"], listing_id: params["id"])
        user = User.find(params["id"])
        user.listings << listing
        params["city_state"].map do |city|
            listing.city_state << Listing.find(listing["id"])
        end
    end 
end
