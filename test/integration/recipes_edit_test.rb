require 'test_helper'

class RecipesEditTest < ActionDispatch::IntegrationTest
  # test "the truth" do  #   assert true  # end
	def setup
		@chef = Chef.create!(chefsname: "manko", email: "manko@recipes.com")
		@recipe = Recipe.create!(name: "vegetable salad", description: "salad of vegetables", chef: @chef)
	end

	test "reject invalid recipe" do
		get edit_recipe_path(@recipe)
		assert_template 'recipes/edit'
		patch recipe_path(@recipe), params: {recipe: {name: "", description: "some description" } }
		assert_template 'recipes/edit'
		assert_select 'div.card-header'
		assert_select 'div.card-body'

	end

	test "successfully edit a recipe" do
		get edit_recipe_path(@recipe)
		assert_template 'recipes/edit'
		updated_name = "updated name"
		updated_desc = "updated desc"
		patch recipe_path(@recipe), params: {recipe: {name: updated_name, description: updated_desc } }
		assert_redirected_to @recipe
		#follow_redirect!
		assert_not flash.empty?
		@recipe.reload
		assert_match updated_name, @recipe.name
		assert_match updated_desc, @recipe.description
	end


end
