class LoginsController < ApplicationController

  def new
  end

  def create
    chef = Chef.find_by(username: params[:username])
    if chef && chef.authenticate(params[:password])
      session[:chef_id] = chef.id
      flash[:success] = "You have successfully logged in."
      redirect_to recipes_path
    else
      flash.now[:danger] = "Your email or password does not match."
      render 'new'
    end
  end

  def destroy
    session[:chef_id] = nil
    flash[:success] = "You have successfully logged out."
    redirect_to root_path
  end

end