class FriendsController < ApplicationController

  def new
    @friend = Friend.new
  end

  def create
    @friend = Friend.create(params[:friend])
  end
end
