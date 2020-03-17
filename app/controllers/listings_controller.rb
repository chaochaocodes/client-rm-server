class ListingsController < ApplicationController
    def index
        listings = Listing.all 
        render json: listings
    end

    # def twenty
    #     twentyListings = Listing.first(20)
    #     render json: twentyListings
    # end
end