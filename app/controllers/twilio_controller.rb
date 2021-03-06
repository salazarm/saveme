require 'twilio-ruby'

class TwilioController < ApplicationController

  # GET /help_me
  def help_me
    d = DateTime.now
    day = d.wday
    time = d.to_time.strftime("%H:%M")
    timeslots = Timeslot.where('day = ? and start_time <= ? and end_time >= ?', day, time, time)
    #debugger; 0


    # FIXME: Refactor this logic...
    unless timeslots.blank?
      people = timeslots.map {|t| t.schedule.person}.uniq unless timeslots.blank?
      people.reject! {|p| p.in_call == true}
      #debugger; 0

      if people.present?
        person = people.first
        initiator_id = params[:From]
        responder_id = person.phone
        msg = Twilio::TwiML::Response.new do |r|
          r.Dial responder_id, :action => '/help_me/call_ended'
          r.Say 'The call failed or the remote party hung up. Goodbye.'
        end.text
        person.in_call = true
        person.save
        CommunicationRecord.create!({:initiator_id => initiator_id, :responder_id => responder_id})
        render :xml => msg
      else
        none_available
      end
    else
      none_available
    end
  end

  def call_ended
    initiator_id = params[:From]

    responder_id = CommunicationRecord.where(:initiator_id => initiator_id).last.responder_id
    responder = Person.where(:phone => responder_id).first
    Person.update(responder.id, :in_call => false)

    render :nothing => true

  end

  protected

  def none_available
    msg = Twilio::TwiML::Response.new do |r|
      r.Say 'I\'m sorry, no one is currently available. Please try again later.'
    end.text
    render :xml => msg
  end
end
