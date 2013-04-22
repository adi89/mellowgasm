class VenuesController < ApplicationController

  def ven_show

    @venue = Venue.find(params[:id])
    if !@venue.photos.present?
      Photo.photo_create(@venue)
    end

    Venue.ratio(@venue)
    @photos = @venue.photos

    #venue show. data put in format. if ratio exists. and u check the same in the other one as well.

    @data =  @venue.ratio * 100




  end





end
