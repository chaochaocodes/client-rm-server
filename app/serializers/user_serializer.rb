class UserSerializer < ActiveModel::Serializer
    has_many :tasks 
    has_many :users_listings
    has_many :listings, through: :users_listings

    attributes :id, :name, :password
end
