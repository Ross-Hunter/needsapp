class SlotsController < ApplicationController
  # GET /slots
  # GET /slots.json
  def index
    @slots = Slot.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @slots }
    end
  end

  # GET /slots/1
  # GET /slots/1.json
  def show
    @slot = Slot.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @slot }
    end
  end

  # GET /slots/new
  # GET /slots/new.json
  def new
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    if !@current_user
      redirect_to root_url, :notice => "You must be logged in to do that!"
      return
    end
    @slot = Slot.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @slot }
    end
  end

  # GET /slots/1/edit
  def edit
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    if !@current_user
      redirect_to root_url, :notice => "You must be logged in to do that!"
      return
    end
    @slot = Slot.find(params[:id])
  end

  # POST /slots
  # POST /slots.json
  def create
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    if !@current_user
      redirect_to root_url, :notice => "You must be logged in to do that!"
      return
    end
    @slot = Slot.new(params[:slot])

    respond_to do |format|
      if @slot.save
        format.html { redirect_to @slot, notice: 'Slot was successfully created.' }
        format.json { render json: @slot, status: :created, location: @slot }
      else
        format.html { render action: "new" }
        format.json { render json: @slot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /slots/1
  # PUT /slots/1.json
  def update
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    if !@current_user
      redirect_to root_url, :notice => "You must be logged in to do that!"
      return
    end
    @slot = Slot.find(params[:id])

    respond_to do |format|
      if @slot.update_attributes(params[:slot])
        format.html { redirect_to @slot, notice: 'Slot was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @slot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /slots/1
  # DELETE /slots/1.json
  def destroy
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    if !@current_user
      redirect_to root_url, :notice => "You must be logged in to do that!"
      return
    end
    @slot = Slot.find(params[:id])
    @slot.destroy

    respond_to do |format|
      format.html { redirect_to :back, notice: 'Slot was removed.' }
      format.json { head :no_content }
    end
  end
end
