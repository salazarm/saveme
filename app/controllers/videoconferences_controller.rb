class VideoconferencesController < ApplicationController
  # GET /videoconferences
  # GET /videoconferences.json
  def index
    @videoconferences = Videoconference.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @videoconferences }
    end
  end

  # GET /videoconferences/1
  # GET /videoconferences/1.json
  def show
    @videoconference = Videoconference.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @videoconference }
    end
  end

  # GET /videoconferences/new
  # GET /videoconferences/new.json
  def new
    @videoconference = Videoconference.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @videoconference }
    end
  end

  # GET /videoconferences/1/edit
  def edit
    @videoconference = Videoconference.find(params[:id])
  end

  # POST /videoconferences
  # POST /videoconferences.json
  def create
    @videoconference = Videoconference.new(params[:videoconference])

    respond_to do |format|
      if @videoconference.save
        format.html { redirect_to @videoconference, notice: 'Videoconference was successfully created.' }
        format.json { render json: @videoconference, status: :created, location: @videoconference }
      else
        format.html { render action: "new" }
        format.json { render json: @videoconference.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /videoconferences/1
  # PUT /videoconferences/1.json
  def update
    @videoconference = Videoconference.find(params[:id])

    respond_to do |format|
      if @videoconference.update_attributes(params[:videoconference])
        format.html { redirect_to @videoconference, notice: 'Videoconference was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @videoconference.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /videoconferences/1
  # DELETE /videoconferences/1.json
  def destroy
    @videoconference = Videoconference.find(params[:id])
    @videoconference.destroy

    respond_to do |format|
      format.html { redirect_to videoconferences_url }
      format.json { head :no_content }
    end
  end
end
