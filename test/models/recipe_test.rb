require 'test_helper'

class RecipeTest < ActiveSupport::TestCase

	def setup
		@chef = Chef.create!(chefsname: "John", email: "john@recipes.com")
		@recipe = @chef.recipes.build(name: "vegetable", description: "great vegetable soup")
	end

	test "recipe should be valid" do 
		assert @recipe.valid?
	end

	test "name should be present" do
		@recipe.name = ""
		assert_not @recipe.valid?
	end

	test "description should be present" do
		@recipe.description = ""
		assert_not @recipe.valid?
	end

	test "description should not be less than 5 characters" do
		@recipe.description = "blah"  
		assert_not @recipe.valid?
	end		

	test "description should not be more than 501 characters" do
		@recipe.description = "b" * 501
		assert_not @recipe.valid?
	end	

	test "recipe without chef should be invalid" do
		@recipe.chef_id = nil
		assert_not @recipe.valid?
	end	

#	test "should get recipes index" do
#		get recipes_url
#		assert_response :success
#	end

end
