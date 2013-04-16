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
    a = HTTParty.get("https://api.foursquare.com/v2/venues/#{venue.foursquare_identification}/photos?client_id=BA3SVMI1K40ZXF2GWCDEDK2QCTTN1QZB3TESSXVRGBM4E1OW&client_secret=FZNQMIZK1TK1XFOBP3LI4M43VV4HJ50WK4XWQBIZHSNQ34YU")

    derp = a["response"]["photos"]["groups"].second["items"].first["sizes"]["items"].second["url"]

    venue.photos << Photo.create(gender: "venue", url: derp)

    a["response"]["photos"]["groups"].second["items"].each do |i|
      c.push(Photo.create(url: i["user"]["photo"], gender: i["user"]["gender"]))
    end

    venue.photos << c

  end



end
