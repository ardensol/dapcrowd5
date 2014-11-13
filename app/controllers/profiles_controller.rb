class ProfilesController < ApplicationController
  # GET /labs
  # GET /labs.json

  before_filter :authenticate_user!, :except => [:index, :show]
  
  def index
    @profiles = Profile.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @profiles }
    end
  end

  # GET /labs/1
  # GET /labs/1.json
  def show
    @profile = Profile.find(params[:id])
    @comments = @profile.user.comments

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @profile }
    end
  end


  def comment
    @profile = Profile.find(params[:id])
    @comments = @profile.user.comments

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @profile }
    end
  end
  # GET /labs/new
  # GET /labs/new.json
  def new
    @profile = Profile.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @lab }
    end
  end

  # GET /labs/1/edit
  def edit
    @profile = Profile.find(params[:id])
  end

  # POST /labs
  # POST /labs.json
  def create
    @profile = Profile.new(params[:profile])

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render json: @profile, status: :created, location: @profile }
      else
        format.html { render action: "new" }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /labs/1
  # PUT /labs/1.json
  def update
    @profile = Profile.find(params[:id])

    respond_to do |format|
      if @profile.update_attributes(params[:profile])
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /labs/1
  # DELETE /labs/1.json
  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy

    respond_to do |format|
      format.html { redirect_to profiles_url }
      format.json { head :no_content }
    end
  end
end
