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

	test "should get chefs show" do
		get chef_path(@chef)
		assert_template 'chefs/show'
		assert_match @chef.chefsname, response.body
	end

	test "reject invalid chef" do
		get signup_path
		assert_template 'chefs/new'
		assert_no_difference 'Chef.count', 1 do
			post chefs_path, params: {chef: {chefsname: "", email: "", password: "", password_confirmation: ""}}			
		end
		assert_select 'div.card-header'
		assert_select 'div.card-body'
	end

	test "create new valid chef" do
		get signup_path
		assert_template 'chefs/new'
		name_of_chef = "Manko"
		email_of_chef = "manko@eascipes.com"
		# assert_difference 'Chef.count', {} do
		# post chefs_path, params: {chef: {name: name_of_chef, email: email_of_chef, password: "password", password_confirmation: "password"}}			
		#post chefs_path, params: {chef: {chefsname: "", email: "", password: "", password_confirmation: ""}}			
  	post chefs_path, params: {chef: {chefsname: name_of_chef, email: email_of_chef, password: "password", password_confirmation: "password"} }
		assert chef_path(@chef)
  	assert flash.empty?
  	@chef.reload
  	assert_match name_of_chef, @chef.chefsname
  	assert_match email_of_chef, @chef.email
		# assert_match name_of_chef.capitalize, response.body
	end

end
