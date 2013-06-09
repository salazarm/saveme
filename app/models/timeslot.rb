class Timeslot < ActiveRecord::Base
  attr_accessible :day, :start_time, :end_time
  belongs_to :schedule
end
