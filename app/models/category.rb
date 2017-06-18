class Category < ActiveRecord::Base
has_many :tours
validates :name, presence: true,
                length: {minimum:3, maximum:30}

end
