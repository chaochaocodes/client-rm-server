class ListingsController < ApplicationController

    def index
        listings = Listing.all 
        render json: listings
    end

    def api_call(city="Seattle", state="WA")
        temp_listing = {}
        listing_array = []
        
        realtor_url = "https://realtor.p.rapidapi.com/properties/list-for-sale"
        rapid_key = ENV["RAPIDAPI_KEY"]
        host = "realtor.p.rapidapi.com"
        
        # byebug
        req = Faraday.get(realtor_url, {city: city, offset: 0, limit: 20, state_code: state}, {'X-RapidAPI-Host': host, 'X-RapidAPI-Key': rapid_key})
        res_body = JSON.parse(req.body)
        res_tracking_params = res_body["meta"]["tracking_params"]
        res_city = res_tracking_params["city"]
        res_state = res_tracking_params["state"]
        res_city_state = res_tracking_params["searchCityState"]
        res_body["listings"].each do |listing|
            #extract property_id
            temp_listing = listing.extract!("prop_type", "price", "address", "beds", "baths", "sqft", "photo", "rdc_web_url")
            temp_listing["city_state"] = res_city_state
            temp_listing["city"] = res_city
            temp_listing["state"] = res_state
            listing_array << Listing.find_or_create_by(temp_listing)
        end
        # listing_array

        #loop through listing_array
        #in loop 
        #listing_array1.property_id get from api
        #fill in these with response from api
        #listing_array1.property_type
        #listing_array1.amenities

        render json: listing_array
    end

    def search(city="Seattle", state="WA")
        temp_listing = {}
        listing_array = []
        
        realtor_url = "https://realtor.p.rapidapi.com/properties/list-for-sale"
        rapid_key = ENV["RAPIDAPI_KEY"]
        host = "realtor.p.rapidapi.com"
        
        # byebug
        req = Faraday.get(realtor_url, {city: params[:search][:city], offset: 0, limit: 30, state_code: params[:search][:state]}, {'X-RapidAPI-Host': host, 'X-RapidAPI-Key': rapid_key})
        res_body = JSON.parse(req.body)
        res_tracking_params = res_body["meta"]["tracking_params"]
        res_city = res_tracking_params["city"]
        res_state = res_tracking_params["state"]
        res_city_state = res_tracking_params["searchCityState"]
        res_body["listings"].each do |listing|
            #extract property_id
            temp_listing = listing.extract!("prop_type", "price", "address", "beds", "baths", "sqft", "photo", "rdc_web_url")
            temp_listing["city_state"] = res_city_state
            temp_listing["city"] = res_city
            temp_listing["state"] = res_state
            listing_array << Listing.new(temp_listing)
        end
        render json: listing_array
    end

    def show
        listing = Listing.find(params[:id])
        render json: listing
    end
end