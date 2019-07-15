class User < ActiveRecord::Base
  has_many :reviews

  validates :first_name, :last_name, :email, :password, :password_confirmation,  presence:true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates_length_of :password, :password_confirmation, minimum:3
  validates_uniqueness_of :email, case_sensitive:false
  has_secure_password

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end
end
