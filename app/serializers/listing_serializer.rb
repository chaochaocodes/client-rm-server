class ListingSerializer < ActiveModel::Serializer
    has_many :users_listings
    has_many :users, through: :users_listings

    attributes :prop_type, :price, :year_built, :city, :line, :postal_code, :state_code, :state, :county, :beds, :baths, :sqft, :hoa_fee, :list_date, :mls_id, :photo
end
