# == Schema Information
#
# Table name: photos
#
#  id         :integer          not null, primary key
#  gender     :string(255)
#  url        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  venue_id   :integer
#

class Photo < ActiveRecord::Base
  attr_accessible :gender, :url
  belongs_to :venue

  def self.photo_create(venue)
    c= []
    a = HTTParty.get("https://api.foursquare.com/v2/venues/#{venue.foursquare_identification}/photos?client_id=#{ENV["F4_CLIENT"]}&client_secret=#{ENV["F4_CLIENT_SECRET"]}")

    if a["response"]["photos"]["groups"].second.present?
      derp = a["response"]["photos"]["groups"].second["items"].first["sizes"]["items"].second["url"]
      venue.photos << Photo.create(gender: "venue", url: derp)
      a["response"]["photos"]["groups"].second["items"].take(10).each do |i|
        venue.photos << Photo.find_or_create_by_url_and_gender(url: i["user"]["photo"], gender: i["user"]["gender"])
      end
      return true
    else
      return false
    end

  end



end
