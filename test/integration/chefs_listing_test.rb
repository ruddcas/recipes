require 'test_helper'

class ChefsTest < ActionDispatch::IntegrationTest
  # test "the truth" do#   assert true# end

	def setup

		@chef = Chef.create!(chefsname: "Manko", email: "manko@eascipes.com",
													password: "password", password_confirmation: "password")
		@chef.save

		@chef2 = Chef.create!(chefsname: "Man", email: "man@eascipes.com",
													password: "password", password_confirmation: "password")
		@chef2.save

		@recipe = Recipe.create!(name: "vegetable salad", description: "salad of vegetables", chef: @chef)
		@recipe2 = @chef.recipes.build(name: "chicken", description: "chicken saute dish")
		@recipe2.save		
	end

	test "should get chefs list" do
		get chefs_path
		assert_response :success
	end

	test "should get chefs index listing" do
		get chefs_path
		assert_template 'chefs/index'
		assert_match @chef.chefsname.capitalize, response.body
		#assert_match @chef2.chefsname.capitalize, response.body
	end

		test "should delete chefs and recipes listing" do
		get chefs_path
		assert_template 'chefs/index'
		assert_difference 'Chef.count', -1 do
			delete chef_path(@chef)
			#delete chef_path(@chef2)
		end
		assert_redirected_to chefs_path
		assert_not flash.empty?
		#assert_match @chef.chefsname.capitalize, response.body
		#assert_match @chef2.chefsname.capitalize, response.body

	end

	test "Associated recipes should be destroyed" do
		@chef.save
		@chef.recipes.create!(name:"testing destroy", description: "testing destroy function")
		assert_difference 'Recipe.count', -3 do
			@chef.destroy
		end
	end

end
