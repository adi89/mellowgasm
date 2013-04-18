class HomeController < ApplicationController
  def index

    @friend = Friend.new
    @friends = Friend.all
    @location = @auth.locations.first
    @venues = @location.venues
    @top_picks = Venue.top_picks
    # @venues = @location.venues
  end

  def new_map

    @motivation = Motivation.where(:desire => params["motivations"]["name"]).first

    @location = Location.find_or_create_by_address(params['serchmap'])
    if !@auth.locations.include? @location
      @auth.locations << @location
    end
    if !@location.venues.where(:motivation_id => @motivation.id).present?
        Venue.make_venues(@location, @motivation)
      end
      @venues = @location.venues.where(:motivation_id => @motivation.id)
      @top_picks = Venue.top_picks
  end
end



# access_token = 4LHKYT3P4GINK5FYWSOLXPIZSKLBZ3NV2IWCWJC5W2VTXCCF

#foursquare.venues.search(:ll => "40.714353,-74.005973")


#4bf58dd8d48988d116941735 bars
#4bf58dd8d48988d11f941735 nightclub



# nightlife = ["4d4b7105d754a06376d81259",
# "4bf58dd8d48988d117941735",
# "4bf58dd8d48988d11e941735",
# "4bf58dd8d48988d118941735",
# "4bf58dd8d48988d1d8941735",
# "4bf58dd8d48988d119941735",
# "4bf58dd8d48988d120941735",
# "4bf58dd8d48988d121941735",
# "4bf58dd8d48988d11f941735",
# "4bf58dd8d48988d11b941735",
# "4bf58dd8d48988d1d4941735",
# "4bf58dd8d48988d122941735"]

# q= client.search_venue(:ll => ' ')
# category_id = q["groups"].first["items"].first["categories"].first["id"]


# https://api.foursquare.com/v2/venues/search?ll=40.7,-74&limit=200&offset=200?client_id=BA3SVMI1K40ZXF2GWCDEDK2QCTTN1QZB3TESSXVRGBM4E1OW&client_secret=FZNQMIZK1TK1XFOBP3LI4M43VV4HJ50WK4XWQBIZHSNQ34YU


# q= client.search_venues(options = {:ll => '40.714353,-74.005973', :limit => 50, :intent => 'browse', :radius => 2000, :categoryId => nightlife[0]})


# "https://api.foursquare.com/v2/venues/4eefd4506d86d722df8fd52e/photos?client_id=BA3SVMI1K40ZXF2GWCDEDK2QCTTN1QZB3TESSXVRGBM4E1OW&client_secret=FZNQMIZK1TK1XFOBP3LI4M43VV4HJ50WK4XWQBIZHSNQ34YU"

#picture= https://irs0.4sqi.net/img/user/100x100/blank_boy.png


#so we have our models.

#user provides his address => That becomes a location (with a latitude and longitude, and of course address)

#Location feeds into the query. Motivation (which has categoryId) also feeds into the Query. that query gets the list of venues.
#what do we do with those venues? We get a list of 50 results or so. Does that mean we populate our database with 50 venues or so ? Or would that increase the loading time too much? If so, then we might wanna limit it to 15 venues to create that amount of objects around. Those objects are saved as venues.

#These venues that are saved have addreses lat and lng. they aso have name.
#venue goes into photos, and we get photos from that..



# "https://api.foursquare.com/v2/venues/#{a}/photos?client_id=BA3SVMI1K40ZXF2GWCDEDK2QCTTN1QZB3TESSXVRGBM4E1OW&client_secret=FZNQMIZK1TK1XFOBP3LI4M43VV4HJ50WK4XWQBIZHSNQ34YU"
