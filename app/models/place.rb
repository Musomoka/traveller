class Place < ActiveRecord::Base
    belongs_to :tour
    has_many :photos
    accepts_nested_attributes_for :photos, :allow_destroy => true
   
end
