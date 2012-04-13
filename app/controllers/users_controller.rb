class UsersController < ApplicationController

  before_filter :authenticate_admin

  def authenticate_admin
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    if !@current_user && !@current_user.admin
      redirect_to root_url, :notice => "You must be logged in and have permission to do that!"
      return
    end
  end

	def new
	  @user = User.new
	end

	def create
	  @user = User.new(params[:user])
	  if @user.save
	    redirect_to '/users', :notice => "Created user"
	  else
	    render "new"
	  end
	end

	  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

   def update
    @user = User.find(params[:id])

    if @user.admin && @current_user.id != 1
      redirect_to '/users', :notice => "Only user 1 may edit admins!"
      return
    end

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to '/users', notice: 'User was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.id == 1
      redirect_to '/users', :notice => "You can't delete user 1"
      return
    end

    if @user.admin && @current_user.id != 1
      redirect_to '/users', :notice => "Only user 1 may delete admins!"
      return
    end

    @user.destroy

    respond_to do |format|
      format.html { redirect_to :back, notice: 'user was removed.' }
    end
  end

   def edit
    @user = User.find(params[:id])

    #protect user #1 and admins
    if @user.id != @current_user.id && @current_user.id != 1
      redirect_to '/users', :notice => "Only user 1 may edit other admins!"
      return
    end

  end

end
