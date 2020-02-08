class ChangeColumnInRecipes < ActiveRecord::Migration[6.0]
  def change
  	change_column :recipes, :description, :text
  end
end
