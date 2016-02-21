class User < ActiveRecord::Base
  has_many :cocktails, dependent: :destroy
  has_many :reviews, dependent: :destroy

  has_secure_password
  has_attachment  :avatar, accept: [:jpg, :png, :gif], maximum: 4

  validates :avatar, presence: true

end
