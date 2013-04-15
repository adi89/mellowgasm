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
#  twitter       :string(255)
#  phone         :string(255)
#  crossStreet   :text
#  venue_Id      :integer
#

class Venue < ActiveRecord::Base
  attr_accessible :name, :address, :rating, :total_votes, :latitude, :longitude, :crossStreet
  has_many :photos
  belongs_to :location

  def make_venues(location, motivation)
    client = Foursquare2::Client.new(:client_id => ENV["F4_CLIENT"], :client_secret => ENV["F4_CLIENT_SECRET"])
    q = client.search_venues(options = {:ll => "#{location.latitude}, #{location.longitude}", :limit => 50, :intent => 'browse', :radius => 2000, :categoryId => motivation.categoryId})

    q["groups"].first["items"].take(20).map{|i| Venue.create(venue_Id: i["id"], phone: i["contact"]["phone"], address: i["location"]["address"], crossStreet: i["location"]["crossStreet"], name: i["name"], latitude: i["location"]["lat"], longitude: i["location"]["lng"] ) if !Venue.where(venue_Id: i["id"]).present?}
    #still missing twitter, photo_url
  end

  def add_twitter_photo(venue)

  end

end
