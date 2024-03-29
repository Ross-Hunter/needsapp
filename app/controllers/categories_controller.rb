class CategoriesController < ApplicationController

  before_filter :authenticate

  def authenticate
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    if !@current_user || !@current_user.admin
      redirect_to needs_url, :notice => "You must be logged in and have permission to do that!"
      return
    end
  end

  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /categories/new
  # GET /categories/new.json
  def new
    @category = Category.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /categories/1/edit
  def edit
    @category = Category.find(params[:id])
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(params[:category])

    respond_to do |format|
      if @category.save
        format.html { redirect_to categories_url, notice: 'Category was successfully created.' }
      end
    end
  end

  # PUT /categories/1
  # PUT /categories/1.json
  def update
    @category = Category.find(params[:id])

    respond_to do |format|
      if @category.update_attributes(params[:category])
        format.html { redirect_to categories_url, notice: 'Category was successfully updated.' }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    respond_to do |format|
      format.html { redirect_to categories_url }
    end
  end

  #For showing all needs that belong to a cateory - not used in final app
  #def needs
    #@category = Category.find(params[:id])
    #@needs = @category.needs
  #end

end
