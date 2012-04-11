class User < ActiveRecord::Base
  attr_accessible :password, :password_confirmation, :admin

  attr_accessor :password
  before_save :encrypt_password

  validates_confirmation_of :password
  validates_presence_of :password
  #validates_uniqueness_of :password
  #validates_presence_of :email
  #validates_uniqueness_of :email

  def self.authenticate(password)
    #debugger
    #user = User.find_by_password_hash(password)
    #user = User.where(:password => password).first
    if user = User.find_by_password_hash(BCrypt::Engine.hash_secret(password, '$2a$10$Ch9fWSFHEz72UeHz5d0CeO'))
      user
    else
      nil
    end
  end

  def encrypt_password
    if password.present?
      #Hardcoding a salt is a really bad idea - but I think password hashing alone is sufficient for this app
      #self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, '$2a$10$Ch9fWSFHEz72UeHz5d0CeO')
    end
  end
end
