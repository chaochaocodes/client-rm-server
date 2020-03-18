class ListingSerializer < ActiveModel::Serializer
    has_many :users_listings
    has_many :users, through: :users_listings

    attributes :prop_type, :price, :address, :beds, :baths, :sqft, :photo, :city_state, :city, :state, :rdc_web_url
end