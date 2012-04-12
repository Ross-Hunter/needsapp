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
	    redirect_to root_url, :notice => "Signed up!"
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

    if @user.id == 1 && @current_user.id != 1
      redirect_to root_url, :notice => "Only user 1 may edit user 1!"
    end

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to '/users', notice: 'user was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to :back, notice: 'user was removed.' }
    end
  end

   def edit
    @user = User.find(params[:id])

    #protect user #1
    if @user.id == 1 && @current_user.id != 1
      redirect_to root_url, :notice => "Only user 1 may edit user 1!"
    end

  end

end
