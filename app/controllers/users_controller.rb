class UsersController < ApplicationController
  before_filter :only_authenticated_users, only: [:show]

  def show
    @auth
#     binding.pry
# @lat = request.location.latitude
# @long = request.location.longitude
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(params[:user])
    binding.pry
    @user.locations << Location.find_or_create_by_latitude(Geocoder.search(@user.address).first.latitude)

  end

end
