class VideoconferencesController < ApplicationController

  def index
  end

  def join_queue
     Pusher['queue'].trigger('add', {:type => params[:type], :id => @current_user.id })
     render :nothing => true
  end


  def create
    @videoconference = Videoconference.new(params[:videoconference])
    if @videoconference.save
      render json: @videoconference, status: :created, location: @videoconference 
    else
      render json: @videoconference.errors, status: :unprocessable_entity 
    end
  end

end
