class NeedsController < ApplicationController

  before_filter :authenticate

  def authenticate
    session[:original_target] = request.url

    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    if !@current_user
      redirect_to root_url, :notice => "You must be logged in and have permission to do that!"
      return
    end
  end

  def authenticate_admin
    if !@current_user.admin
      redirect_to needs_url, :notice => "You must be logged in and have permission to do that!"
      return
    end
  end

  def index
    start_date  = Date.today
    end_date    = Date.today + 1.year

    if params[:start_date] && params[:start_date] > ''
        start_date = params[:start_date].to_date
    end

    if params[:end_date] && params[:end_date] > ''
        end_date = params[:end_date].to_date
    end

    query = Need.scoped
    query = query.between(start_date, end_date).order(:date)
    if params["need"] && params["need"]["category"] > ''
      query = query.where(:category_id => params["need"]["category"])
      @category = Category.where(:id => params["need"]["category"]).first
    end
    if params[:q]
      #limiting and searching do not work together, I am punting for now
      query = query.search(params[:q])
    else
      query = query.limit(Configurable.needs_per_query)
    end

    @needs = query

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /needs/new
  # GET /needs/new.json
  def new
    authenticate_admin

    @need = Need.new
    @need.slots.build
    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /needs/1/edit
  def edit
    authenticate_admin

    @need = Need.find(params[:id])
  end

  # POST /needs
  # POST /needs.json
  def create
    authenticate_admin

    @need = Need.new(params[:need])

    if !@need.is_repeat && @need.num_repeats && @need.frequency
      @need.repeat(@need.frequency, @need.num_repeats)
    end

    respond_to do |format|
      if @need.save
        format.html { redirect_to needs_url, notice: "\"#{@need.title}\" was successfully created." }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /needs/1
  # PUT /needs/1.json
  def update
    @need = Need.find(params[:id])

    respond_to do |format|
      if @need.update_attributes(params[:need])
        format.html { redirect_to needs_url, notice: "\"#{@need.title}\" was successfully updated." }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /needs/1
  # DELETE /needs/1.json
  def destroy
    authenticate_admin

    @need = Need.find(params[:id])
    @need.destroy

    respond_to do |format|
      format.html { redirect_to needs_url }
      format.json { head :no_content }
    end
  end

end
