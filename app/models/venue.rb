# == Schema Information
#
# Table name: venues
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  address       :string(255)
#  rating        :integer          default(0)
#  venue_url     :text
#  photo_url     :text
#  total_votes   :integer          default(0)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  location_id   :integer
#  motivation_id :integer
#  latitude      :float
#  longitude     :float
#

class Venue < ActiveRecord::Base
  attr_accessible :name, :address, :rating, :total_votes, :latitude, :longitude
  has_many :photos
  belongs_to :locations


  def make_venues(location, motivation)
     client = Foursquare2::Client.new(:client_id => ENV["F4_CLIENT"], :client_secret => ENV["F4_CLIENT_SECRET"])
     q= client.search_venues(options = {:ll => "#{location.latitude}, #{location.longitude}", :limit => 50, :intent => 'browse', :radius => 2000, :categoryId => motivation.categoryId)
  end




end

