class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :name, :email, :password, :password_confirmation, :gender, :address, :phone
  has_many :locations
  has_many :motivations
  has_many :friends
end