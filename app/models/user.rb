class User < ActiveRecord::Base
  has_many :characters
  validates_uniqueness_of :username
  has_secure_password
end
