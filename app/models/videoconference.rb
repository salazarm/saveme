class Videoconference < ActiveRecord::Base
  attr_accessible :savee, :saver, :savee_rating, :saver_rating, :savee_id, :saver_id

  has_one :savee, :through => :person
  has_one :saver, :through => :person
  has_many :messages
 
  before_create  { generate_token(:conference_token) }

  def self.generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while Videoconference.exists?(column => self[column]) 
  end

end