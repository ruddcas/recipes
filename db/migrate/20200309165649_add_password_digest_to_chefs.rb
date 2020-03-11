class AddPasswordDigestToChefs < ActiveRecord::Migration[6.0]
  def change
  	#Add new column of type string named = :password_digest to the table chefs 
  	#and run the command "rails db:migrate"
  	add_column :chefs, :password_digest, :string
  end
end
