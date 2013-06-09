class CommunicationRecord < ActiveRecord::Base
  attr_accessible :rating, :initiator_id, :responder_id, :duration
  belongs_to :initiator, :class_name => "Person", :foreign_key => "initiator_id"
  belongs_to :responder, :class_name => "Person", :foreign_key => "responder_id"
end