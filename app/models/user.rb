class User < ActiveRecord::Base
  has_many :cocktails, dependent: :destroy
  has_many :reviews, dependent: :destroy

  has_secure_password
  has_attachment  :avatar, accept: [:jpg, :png, :gif], maximum: 4

  validates :avatar, presence: true

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

end
