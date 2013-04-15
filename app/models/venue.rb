# == Schema Information
#
# Table name: venues
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  address     :string(255)
#  rating      :integer          default(0)
#  venue_url   :text
#  photo_url   :text
#  total_votes :integer          default(0)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Venue < ActiveRecord::Base
  attr_accessible :name, :address, :rating, :total_votes
  has_many :photos
  belongs_to :locations

end
