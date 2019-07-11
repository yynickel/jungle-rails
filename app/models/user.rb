class User < ActiveRecord::Base
  attr_accessor :confirm_password

  has_secure_password
end
