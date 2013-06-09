class VideoconferencesController < ApplicationController

  def index
  end

  def join_queue
    Pusher['private-queue'].trigger('client-add', {:type => params[:type], :id => @current_user.id })
    render :nothing => true
  end


  def create
    @videoconference = Videoconference.new(params[:videoconference])
    if @videoconference.save
      [@videoconference.savee.id.to_s, @videoconference.saver.id.to_s].each do |id|
        puts id
        Pusher['client-'+id].trigger(
          'private-token', { 
            :token => @videoconference.auth_token
          }
        )
      end
      render :nothing => true 
    else
      render json: @videoconference.errors, status: :unprocessable_entity 
    end
  end

  def end_call
    @videoconference = Videoconference.find_by_id(params[:conf_id])
    duration = Time.now - @videoconference.created_at
    cr = CommunicationRecord.new({ 
        :initiator => @videoconference.savee,
        :responder => @videoconference.saver,
        :rating => @params[:rating],
        :duration => duration
      })
    if cr.save
      render :nothing => true, :status => 200
    else
      render :nothing => true, :status => 500
    end
  end
end
