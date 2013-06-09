class Person < ActiveRecord::Base
  VALID_EMAIL_REGEX = /^.+@.+\..+$/i 
  attr_accessible :image, :ip, :is_anon, :name, :password, :password_confirmation, :email, :phone, :in_call
  attr_accessor :password, :password_confirmation

  before_create { generate_token(:auth_token) }
  has_one :schedule
  has_many :videoconferences
  has_and_belongs_to_many :incident_reports
  has_many :communication_records


  before_validation :downcase_email

  # NOT validating presence_of :phone, since person may only want to use the web interface
  validates_presence_of :email, :password, :password_confirmation, 
                          :on => :create, :unless => "is_anon"
   
  validates :password, :length => (6..32), :confirmation => true, :if => :setting_password?

  validates :email, :uniqueness => true, 
              :format => {:with => VALID_EMAIL_REGEX },
              :unless => "is_anon"

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while Person.exists?(column => self[column]) 
  end

  def password=(password_str)
    @password = password_str
    write_attribute(:password_salt, BCrypt::Engine.generate_salt)
    write_attribute(:password_digest, BCrypt::Engine.hash_secret(password_str, password_salt))
  end

  # Used to tell if we need to validate the password
  def setting_password?
    self.password || self.password_confirmation
  end
 
  # Checks if the user provided the correct password
  def authenticate(password)
    password.present? && password_digest.present? && password_digest == BCrypt::Engine.hash_secret(password, password_salt)
  end

  def downcase_email
    self.email = self.email.downcase if self.email.present?
  end

end
