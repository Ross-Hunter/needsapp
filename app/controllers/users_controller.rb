class UsersController < ApplicationController
	def new
	  @user = User.new
	end

	def create
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
    if !@current_user || !@current_user.admin
      redirect_to root_url, :notice => "You must be logged in and have permission to do that!"
      return
    end

	  @user = User.new(params[:user])
	  if @user.save
	    redirect_to root_url, :notice => "Signed up!"
	  else
	    render "new"
	  end
	end

	  def index
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    if !@current_user || !@current_user.admin
      redirect_to root_url, :notice => "You must be logged in and have permission to do that!"
      return
    end

    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

   def update
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    if !@current_user || !@current_user.admin
      redirect_to root_url, :notice => "You must be logged in and have permission to do that!"
      return
    end
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'user was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    if !@current_user || !@current_user.admin
      redirect_to root_url, :notice => "You must be logged in and have permission to do that!"
      return
    end
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to :back, notice: 'user was removed.' }
    end
  end

   def edit
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    if !@current_user || !@current_user.admin
      redirect_to root_url, :notice => "You must be logged in and have permission to do that!"
      return
    end
    @user = User.find(params[:id])
  end

end
