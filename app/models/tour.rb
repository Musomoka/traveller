class Tour < ActiveRecord::Base
    belongs_to :user
    belongs_to :category
    has_many :places
   
end
