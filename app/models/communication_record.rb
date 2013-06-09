class CommunicationRecord < ActiveRecord::Base
  attr_accessible :rating, :initiator_id, :responder_id
  belongs_to :person, :class_name => "Person", :foreign_key => "initiator_id"
  belongs_to :person, :class_name => "Person", :foreign_key => "responder_id"
end