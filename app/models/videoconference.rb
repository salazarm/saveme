class Videoconference < ActiveRecord::Base
  attr_accessible :savee, :saver, :savee_rating, :saver_rating, :savee_id, :saver_id

  belongs_to :savee, :class_name => "Person", :foreign_key => "savee_id"
  belongs_to :saver, :class_name => "Person", :foreign_key => 'saver_id'
  has_many :messages
 
  before_create  { generate_token(:auth_token) }

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while Videoconference.exists?(column => self[column]) 
  end

end