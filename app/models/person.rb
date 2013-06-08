class Person < ActiveRecord::Base
  VALID_EMAIL_REGEX = /^.+@.+\..+$/i 
  attr_accessible :image, :ip, :is_anon, :name, :password, :password_confirmation, :email
  attr_accessor :password, :password_confirmation

  before_create { generate_token(:auth_token) }, :unless => "is_anon"

  before_validation :downcase_email

  validates_presence_of :email, :password, :password_confirmation, 
                          :on => :create, :unless => "is_anon"
   
  validates :password, :length => (6..32), :confirmation => true, :if => :setting_password?

  validates :email, :uniqueness => true, 
              :format => {:with => VALID_EMAIL_REGEX },
              :unless => "is_anon"

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
