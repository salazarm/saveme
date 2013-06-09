class PusherController < ApplicationController
  protect_from_forgery :except => :auth

	def auth
    response = Pusher[params[:channel_name]].authenticate(params[:socket_id])
    render :json => response
  end
  
end
