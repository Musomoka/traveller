class Tour < ActiveRecord::Base
    belongs_to :user
    belongs_to :category
    has_many :itinerary
    has_many :places, through: :itinerary
    accepts_nested_attributes_for :itinerary, allow_destroy: true
    has_many :comments, :as => :commentable
end
