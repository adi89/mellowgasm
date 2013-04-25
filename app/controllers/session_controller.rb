class SessionController < ApplicationController
  def new
    binding.pry
  end

  def create
    binding.pry
    user = User.where(:email => params[:email]).first
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      authenticate
      redirect_to(home_path)
    else
      session[:user_id] = nil
      binding.pry
    end

  end

  def destroy
    session[:user_id] = nil
    authenticate
    redirect_to(root_path)

  end
end