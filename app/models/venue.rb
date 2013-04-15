# == Schema Information
#
# Table name: venues
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  address       :string(255)
#  rating        :integer          default(0)
#  total_votes   :integer          default(0)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  location_id   :integer
#  motivation_id :integer
#  latitude      :float
#  longitude     :float
#  twitter       :string(255)
#  phone         :string(255)
#  crossStreet   :text
#

class Venue < ActiveRecord::Base
  attr_accessible :name, :address, :rating, :total_votes, :twitter, :phone, :crossStreet
  has_many :photos
  belongs_to :locations

end
