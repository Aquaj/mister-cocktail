class AddDescriptionToCocktails < ActiveRecord::Migration
  def change
    add_column :cocktails, :description, :text
  end
end
