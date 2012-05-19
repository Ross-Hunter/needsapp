class User < ActiveRecord::Base
  attr_accessible :password, :password_confirmation, :admin, :label

  attr_accessor :password
  before_save :encrypt_password

  validates_confirmation_of :password
  validates_presence_of :password

  def self.authenticate(password)
    if user = User.find_by_password_hash(BCrypt::Engine.hash_secret(password, '$2a$10$Ch9fWSFHEz72UeHz5d0CeO'))
      user
    else
      nil
    end
  end

  def encrypt_password
    if password.present?
      #Hardcoding a salt is a really bad idea - but I think password hashing alone is sufficient for this app
      #Allows us to authenticate using only a password and not a username
      self.password_hash = BCrypt::Engine.hash_secret(password, '$2a$10$Ch9fWSFHEz72UeHz5d0CeO')
    end
  end
end
