require 'test_helper'

class ChefsTest < ActionDispatch::IntegrationTest
  # test "the truth" do#   assert true# end

	def setup
		@chef = Chef.create!(chefsname: "Manko", email: "manko@eascipes.com",
													password: "password", password_confirmation: "password")
		@chef.save	
		@recipe = Recipe.create!(name: "vegetable salad", description: "salad of vegetables", chef: @chef)
		@recipe2 = @chef.recipes.build(name: "chicken", description: "chicken saute dish")
		@recipe2.save		
	end

	test "should get chefs index" do
		get chefs_path
		assert_response :success
	end

	test "should get chefs listing" do
		get chefs_path
		assert_template 'chefs/index'
		assert_match @chef.chefsname, response.body
	end

end
