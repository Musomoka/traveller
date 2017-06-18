class Guide < ActiveRecord::Base
  belongs_to :user
  belongs_to :organisation
    validates_presence_of :name, presence: true
    has_many :tours
    has_many :places, through: :tours
    has_many :comments, :as => :commentable
end
