class Venue < ActiveRecord::Base
  attr_accessible :name, :address, :rating
  has_many :photos
  belongs_to :locations
  belongs_to
  has_many :friends
end