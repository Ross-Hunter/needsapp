class Admin::ConfigurablesController < ApplicationController

	before_filter :authenticate_admin

	include ConfigurableEngine::ConfigurablesController

  def authenticate_admin
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    if !@current_user && !@current_user.admin
      redirect_to root_url, :notice => "You must be logged in and have permission to do that!"
      return
    end
  end

end
