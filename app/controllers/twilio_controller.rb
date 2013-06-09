require 'twilio-ruby'

class TwilioController < ApplicationController

  # GET /help_me
  def help_me
    d = DateTime.now
    day = d.wday
    time = d.to_time.strftime("%H:%M")

    timeslots = Timeslot.where('day = ? and start_time <= ? and end_time >= ?', day, time, time)
    unless timeslots.blank?
      people = timeslots.map {|t| t.schedule.person}.uniq unless timeslots.blank?
      people.reject! {|p| p.in_call == true}
      #people.first.phone
      #debugger; 0
    end

  end

  # GET /hello-monkey
  def hello_monkey
    
    people = {
        '+14158675309' => 'Curious George',
        '+14158675310' => 'Boots',
        '+14158675311' => 'Virgil',
        '+14158675312' => 'Marcel',
    }
    name = people[params['From']] || 'Monkey'
    msg = Twilio::TwiML::Response.new do |r|
      r.Say "Hello #{name}"
      r.Play 'http://demo.twilio.com/hellomonkey/monkey.mp3'
      r.Gather :numDigits => '1', :action => '/hello-monkey/handle-gather', :method => 'get' do |g|
        g.Say 'To speak to a real monkey, press 1.'
        g.Say 'Press any other key to start over.'
      end
    end.text
    #debugger; 0
    #render :nothing => true
    render :xml => msg
  end

  # GET /hello-monkey/handle-gather
  def handle_gather
    redirect_to '/hello-monkey' unless params['Digits'] == '1'
    msg = Twilio::TwiML::Response.new do |r|
      r.Dial '+15104275100' ### Connect the caller to Koko, or your cell
      r.Say 'The call failed or the remote party hung up. Goodbye.'
      end.text
    render :xml => msg
  end
end
