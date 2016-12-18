class Guide < ActiveRecord::Base
  belongs_to :user
  belongs_to :organisation
    validates_pressence :name, presence: true
    has_many :tours
    has_many :places, through: tours
end
