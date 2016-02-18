class AddCategoryToCocktails < ActiveRecord::Migration
  def change
    add_column :cocktails, :category, :references
  end
end
