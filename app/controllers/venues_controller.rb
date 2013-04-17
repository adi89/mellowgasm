class VenuesController < ApplicationController

def ven_show

  @venue = Venue.find(params[:id])
@photos = @venue.photos

end





  end
