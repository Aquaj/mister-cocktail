class Cocktail < ActiveRecord::Base
  has_many :doses, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :ingredients, through: :doses
  belongs_to :category
  belongs_to :user

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :category_id, presence: true
  validates :description, presence: true
end
