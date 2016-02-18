class Review < ActiveRecord::Base
  belongs_to :cocktail
  belongs_to :user

  validates :content, presence: true
  validates :rating, presence: true
  validates :cocktail_id, presence: true
  validates :user_id, presence: true
  validates :cocktail_id, uniqueness: { scope: :user_id }
end
