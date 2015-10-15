require 'bcrypt'

class User < ActiveRecord::Base

  include BCrypt

  validates_presence_of :full_name, :location
  validates_length_of :bio, :minimum => 30, :allow_blank => false
  validates_uniqueness_of :email

  #validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
  validates :email,
            :format => {:with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/},
            :presence => true

  has_secure_password

  # def password
  #   @password ||= Password.new(password_hash)
  # end
  #
  # def password=(new_password)
  #   @password = Password.create(new_password)
  #   self.password_hash = @password
  # end

end
