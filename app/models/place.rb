class Place < ActiveRecord::Base
   
    has_many :iteneraries
    has_many :tours,through: :itinerary
    has_many :photos
    accepts_nested_attributes_for :photos, :allow_destroy => true
  
    has_many :comments, :as => :commentable
    accepts_nested_attributes_for :comments, :allow_destroy => true
end
