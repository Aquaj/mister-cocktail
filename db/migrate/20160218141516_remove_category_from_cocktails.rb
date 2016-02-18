class RemoveCategoryFromCocktails < ActiveRecord::Migration
  def change
    remove_column :cocktails, :category
  end
end
