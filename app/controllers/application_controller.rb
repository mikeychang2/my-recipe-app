class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # makes these methods available to views
  helper_method :current_user, :logged_in?

  # available to app but not views unless with helper methods
  def current_user
    @current_user ||= Chef.find(session[:chef_id]) if session[:chef_id]
  end

  # returns a boolean with !!
  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:danger] = "You must be logged in to perform the action."
      redirect_to :back
    end
  end

end
