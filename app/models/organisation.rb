class Organisation < ActiveRecord::Base
    has_many :guides
    validates :name, presence: true
end
