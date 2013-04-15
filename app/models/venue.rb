
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