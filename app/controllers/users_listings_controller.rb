class UsersListingsController < ApplicationController
  # skip_before_action :authorized, only: [:save_listing]

    def index
      users_listings = UsersListing.all 
      render json: users_listings
    end

    def save_listing
      # byebug
      listing = Listing.find_or_create_by(params[:listing][:result].permit!)
      user = User.find(params[:user_id])
      user.listings << listing
      render json: user.listings
    end

    def delete_listing
        listing = Listing.find_by(params[:listing][:result].permit!)
        byebug
        listing.destroy 
        puts "Listing Deleted!"
    end

    # def show
    #     users_listing = UsersListing.where(user_id: params[:user_id])
    #     render json: users_listing
    # end
    
end
