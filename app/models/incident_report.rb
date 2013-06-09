class IncidentReport < ActiveRecord::Base
  attr_accessible :latitude, :longitude, :description

  validates :description, :presence => true
  validates :latitude,    :presence => true
  validates :longitude,   :presence => true
end