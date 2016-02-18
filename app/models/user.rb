class User < ActiveRecord::Base
  has_many :cocktails, dependent: :destroy
  has_secure_password

end
