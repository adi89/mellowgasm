class VenuesController < ApplicationController

def ven_show

  @venue = Venue.find(params[:id])
  if !@venue.photos.present?
    Photo.photo_create(@venue)
  end

  Venue.ratio(@venue)
@photos = @venue.photos

end





  end
