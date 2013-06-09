class Schedule < ActiveRecord::Base
  belongs_to :person
  has_many :timeslots
end