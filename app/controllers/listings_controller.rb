class ListingsController < ApplicationController
    # FOR_SALE = "https://realtor.p.rapidapi.com/properties/list-for-sale"
    # RAPIDAPI_API_KEY = "72b1218e73msh46befd722be0f47p1b902ejsn53661bed7071"
    # host = "realtor.p.rapidapi.com"

    def index
        listings = Listing.all 
        render json: listings
    end

    def api_call
        # search = params[:search]
        # search.city
        temp_listing = {}
        listing_array = []

        realtor_url = "https://realtor.p.rapidapi.com/properties/list-for-sale"
        rapid_key = ENV["RAPIDAPI_KEY"]
        host = "realtor.p.rapidapi.com"

        req = Faraday.get(realtor_url, {city: "New York City", offset: 0, limit: 5, state_code: "NY"}, {'X-RapidAPI-Host': host, 'X-RapidAPI-Key': rapid_key})
        res_body = JSON.parse(req.body)
        res_tracking_params = res_body["meta"]["tracking_params"]
        res_city = res_tracking_params["city"]
        res_state = res_tracking_params["state"]
        res_city_state = res_tracking_params["searchCityState"]
        res_body["listings"].each do |listing|
            temp_listing = listing.extract!("prop_type", "price", "address", "beds", "baths", "sqft", "photo", "rdc_web_url")
            temp_listing["city_state"] = res_city_state
            temp_listing["city"] = res_city
            temp_listing["state"] = res_state
            listing_array << Listing.create(temp_listing)
        end
        render json: listing_array

        #Saving a listing in the database and assigning it's properties
        # save_listings = Listing.create do |key|
        #     key.prop_type = temp_listing["prop_type"]
        #     key.price = temp_listing["price"]
        #     key.address = temp_listing["address"] 
        #     key.beds = temp_listing["beds"]
        #     key.baths = temp_listing["baths"]
        #     key.sqft = temp_listing["sqft"]
        #     if temp_listing["photo"].length === 0
        #         key.photo = "https://image.shutterstock.com/image-vector/no-image-available-icon-template-260nw-1036735678.jpg"
        #     else 
        #         key.photo = temp_listing["photo"]
        #     end
        #     key.city_state = temp_listing["city_state"]
        #     key.rdc_web_url = temp_listing["rdc_web_url"]
        #     key.city = temp_listing["city"]
        #     key.state = temp_listing["state"]
        # end
        # render json: save_listings
    end

    def twenty
        twentyListings = Listing.first(20)
        render json: twentyListings
    end

end