class User < ApplicationRecord
  before_save { self.email = email.downcase }
  validates_presence_of :fullname, :password, :email, :phone_number, :address, :password_confirmation
  validates_uniqueness_of :email
  
  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/ }
  has_secure_password
  validates_length_of :password, minimum: 6, maximum: 20
  before_validation { self.password_confirmation ||= password }
end
