class Itinerary < ActiveRecord::Base
  belongs_to :tour
  belongs_to :place
end
