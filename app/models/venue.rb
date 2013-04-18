# == Schema Information
#
# Table name: venues
#
#  id                        :integer          not null, primary key
#  name                      :string(255)
#  address                   :string(255)
#  rating                    :float            default(0.0)
#  total_votes               :integer          default(0)
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  location_id               :integer
#  motivation_id             :integer
#  latitude                  :float
#  longitude                 :float
#  twitter                   :string(255)      default("")
#  phone                     :string(255)
#  crossStreet               :text
#  foursquare_identification :string(255)
#  venue_url                 :string(255)      default("")
#  distance                  :integer
#  ratio                     :float            default(0.0)
#  foursquare_rating         :float            default(0.0)
#

class Venue < ActiveRecord::Base
  attr_accessible :name, :address, :rating, :total_votes, :latitude, :longitude, :crossStreet, :foursquare_identification, :phone, :distance, :twitter
  has_many :photos
  belongs_to :location
  # validates :foursquare_identification, :uniqueness => true
  # after_save :ratio
  # after_save :rate

  def self.ratio(venue)
    client = Foursquare2::Client.new(:client_id => ENV["F4_CLIENT"], :client_secret => ENV["F4_CLIENT_SECRET"])
    b = client.venue(venue.foursquare_identification)

    if b["photos"]["groups"].second["items"].present?
      users = b["photos"]["groups"].second["items"].map{|i| i["user"]["gender"]}
      guy = users.count("male").to_f
      girl = users.count("female").to_f
      venue.ratio = (girl/(girl + guy)).round(2)
      venue.foursquare_rating = b["rating"]/10.0
      venue.save
      return true
    else
      venue.foursquare_rating = b["rating"]/10.0
      venue.save
      return false
    end
  end


  def self.make_venues(location, motivation)
    client = Foursquare2::Client.new(:client_id => ENV["F4_CLIENT"], :client_secret => ENV["F4_CLIENT_SECRET"])
    q = client.search_venues(options = {:ll => "#{location.latitude}, #{location.longitude}", :limit => 50, :intent => 'browse', :radius => 1000, :categoryId => motivation.categoryId})
    q["groups"].first["items"].each do |i|

    a=  Venue.create(foursquare_identification: i["id"], phone: i["contact"]["phone"], address: i["location"]["address"], crossStreet: i["location"]["crossStreet"], name: i["name"], latitude: i["location"]["lat"], longitude: i["location"]["lng"], :twitter => i["contact"]["twitter"], :distance => i["location"]["distance"])
      a.name.gsub("'", "")
      a.save
      location.venues << a
      motivation.venues << a
      # Venue.ratio(a)
      # location.venues << venue
      # motivation.venues << venue
     end
  end


  def self.top_picks
    Venue.all.sort_by{|i| (i.ratio + i.foursquare_rating)*0.5}.last(10).map{|i| i.name}.reverse

    #top venues that the user has found.
    #gives the 10 venues with the highest ratios.
  end

  def rate
    ratio = (self.ratio/0.70)
    client = Foursquare2::Client.new(:client_id => ENV["F4_CLIENT"], :client_secret => ENV["F4_CLIENT_SECRET"])
    a = client.venue(self.foursquare_identification)
    checkins = (a["stats"]["checkinsCount"].to_f)/30000.00
    foursqRating = (a["rating"].to_f/10.00)
    self.rating = ((foursqRating * 0.40) + (checkins * 0.25) + (ratio * 0.35)).round(2)
    self.save
  end

end
