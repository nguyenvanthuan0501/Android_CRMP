class User < ApplicationRecord
  validates_presence_of :fullname, :password, :email, :phone_number, :address
  validates_uniqueness_of :email
  validates_length_of :password, minimum: 6, maximum: 20
  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/ }
  has_secure_password

end
