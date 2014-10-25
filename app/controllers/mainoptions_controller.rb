class MainoptionsController < ApplicationController
  # GET /mainoptions
  # GET /mainoptions.json

  before_filter :authenticate_user!, :except => [:index, :show]
  before_filter :verify_admin, :except => [:index, :show]
  
  def index
    @mainoptions = Mainoption.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mainoptions }
    end
  end

  # GET /mainoptions/1
  # GET /mainoptions/1.json
  def show
    @mainoption = Mainoption.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mainoption }
    end
  end

  # GET /mainoptions/new
  # GET /mainoptions/new.json
  def new
    @mainoption = Mainoption.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mainoption }
    end
  end

  # GET /mainoptions/1/edit
  def edit
    @mainoption = Mainoption.find(params[:id])
  end

  # POST /mainoptions
  # POST /mainoptions.json
  def create
    @mainoption = Mainoption.new(params[:mainoption])

    respond_to do |format|
      if @mainoption.save
        format.html { redirect_to @mainoption, notice: 'Mainoption was successfully created.' }
        format.json { render json: @mainoption, status: :created, location: @mainoption }
      else
        format.html { render action: "new" }
        format.json { render json: @mainoption.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mainoptions/1
  # PUT /mainoptions/1.json
  def update
    @mainoption = Mainoption.find(params[:id])

    respond_to do |format|
      if @mainoption.update_attributes(params[:mainoption])
        format.html { redirect_to @mainoption, notice: 'Mainoption was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mainoption.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mainoptions/1
  # DELETE /mainoptions/1.json
  def destroy
    @mainoption = Mainoption.find(params[:id])
    @mainoption.destroy

    respond_to do |format|
      format.html { redirect_to mainoptions_url }
      format.json { head :no_content }
    end
  end

  def upvote
  @mainoption = Mainoption.find(params[:id])
  @mainoption.upvote_by current_user
    respond_to do |format|
      format.html {redirect_to :back }
      format.json { render json: { count: @mainoption.score } }
    end
  end


end
