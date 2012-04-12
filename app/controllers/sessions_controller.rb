class SessionsController < ApplicationController
	def new
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
    if @current_user
      	redirect_to '/needs', :notice => "Successfully logged in!"
    end
	end

	def create
	  user = User.authenticate(params[:password])
	  if user
	    session[:user_id] = user.id
	    redirect_to "/needs", :notice => "Logged in!"
	  else
	    flash.now.alert = "Invalid password"
	    render "new"
	  end
	end

	def destroy
	  session[:user_id] = nil
	  redirect_to root_url, :notice => "Logged out!"
	end
end
