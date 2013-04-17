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
    @user.locations << Location.create(address: @user.address)

  end

end
