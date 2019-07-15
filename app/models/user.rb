class User < ActiveRecord::Base
  has_many :reviews

  validates :first_name, :last_name, :email, :password, :password_confirmation,  presence:true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates_uniqueness_of :email, case_sensitive:false
  has_secure_password
end
