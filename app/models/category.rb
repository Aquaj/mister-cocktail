class Category < ActiveRecord::Base
  has_many :cocktails, dependent: :destroy
end
