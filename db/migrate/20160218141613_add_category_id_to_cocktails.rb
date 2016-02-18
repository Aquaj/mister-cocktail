class AddCategoryIdToCocktails < ActiveRecord::Migration
  def change
    add_reference :cocktails, :category, index: true, foreign_key: true
  end
end
