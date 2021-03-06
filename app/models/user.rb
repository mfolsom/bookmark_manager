require 'bcrypt'
require 'data_mapper'

class User
  include DataMapper::Resource
  attr_reader :password
  attr_accessor :password_confirmation
  validates_confirmation_of :password, :message => "Sorry, your passwords don't match"
  validates_uniqueness_of :email

  property :id, Serial
  property :email, String, :required => true, :unique => true, :format => :email_address,
  :messages => {
    :presence => "We need your email address",
    :is_unique => "We already have that email.",
    :format => "Doesn't look like an email address to me..."
  }
  property :password_digest, Text

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email,password)
    user = first(:email =>email)
    if user && BCrypt::Password.new(user.password_digest)==password
      user
    else
      nil
    end
  end
end