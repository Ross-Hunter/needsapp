class NeedsController < ApplicationController
  # GET /needs
  # GET /needs.json
  def index
    start_date = Date.today
    end_date = Date.today + 1.year

    if params[:start_date]
      if params[:start_date] > ''
        start_date = params[:start_date].to_date
      end
    end

    if params[:end_date]
      if params[:end_date] > ''
        end_date = params[:end_date].to_date
      end
    end

    if params[:q]
      @needs = Need.between(start_date, end_date).order(:date).search(params[:q])
    else
      @needs = Need.between(start_date, end_date).order(:date)
    end

    if params["need[category]"]
      @needs = Need.where(:category_id => params["need[category]"])
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @needs }
    end
  end

  # GET /needs/1
  # GET /needs/1.json
  def show
    @need = Need.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @need }
    end
  end

  # GET /needs/new
  # GET /needs/new.json
  def new
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    if !@current_user
      redirect_to root_url, :notice => "You must be logged in to do that!"
      return
    end

    @need = Need.new
    @need.slots.build
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @need }
    end
  end

  # GET /needs/1/edit
  def edit
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    if !@current_user
      redirect_to root_url, :notice => "You must be logged in to do that!"
      return
    end

    @need = Need.find(params[:id])
  end

  # POST /needs
  # POST /needs.json
  def create
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    if !@current_user
      redirect_to root_url, :notice => "You must be logged in to do that!"
      return
    end

    @need = Need.new(params[:need])
    respond_to do |format|
      if @need.save
        format.html { redirect_to '/needs', notice: "\"#{@need.title}\" was successfully created." }
        format.json { render json: @need, status: :created, location: @need }
      else
        format.html { render action: "new" }
        format.json { render json: @need.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /needs/1
  # PUT /needs/1.json
  def update
    @need = Need.find(params[:id])

    respond_to do |format|
      if @need.update_attributes(params[:need])
        format.html { redirect_to '/needs', notice: "\"#{@need.title}\" was successfully updated." }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @need.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /needs/1
  # DELETE /needs/1.json
  def destroy
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    if !@current_user
      redirect_to root_url, :notice => "You must be logged in to do that!"
      return
    end

    @need = Need.find(params[:id])
    @need.destroy

    respond_to do |format|
      format.html { redirect_to needs_url }
      format.json { head :no_content }
    end
  end

  def search
    @needs = Need.search(params[:q])
  end

end
