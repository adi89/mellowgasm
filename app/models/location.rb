# == Schema Information
#
# Table name: locations
#
#  id         :integer          not null, primary key
#  address    :string(255)
#  latitude   :float
#  longitude  :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Location < ActiveRecord::Base
attr_accessible :address, :latitude, :longitude
belongs_to :user
has_many :venues
before_save :latlng


def latlng
  result = Geocoder.search(self.address).first
  if result.present?
      self.latitude = result.latitude
      self.longitude = result.longitude
    end
  end
#we save the searches in the database.

end


