class Place < ActiveRecord::Base
   
    has_many :iteneraries
    has_many :tours,through: :itinerary
    has_many :photos
    has_many :comments, :as => :commentable
    has_many :address
    accepts_nested_attributes_for :photos,:address, :allow_destroy => true
end
