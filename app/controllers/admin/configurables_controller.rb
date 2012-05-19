#This is for site wide configurations such as footer text
class Admin::ConfigurablesController < ApplicationController
	include ConfigurableEngine::ConfigurablesController

	before_filter :authenticate_admin

  def authenticate_admin
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    if !@current_user && (@current_user.id !=1)
      redirect_to root_url, :notice => "You must be logged in and have permission to do that!"
      return
    end
  end

end
