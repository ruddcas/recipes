require 'test_helper'

class ChefsEditTest < ActionDispatch::IntegrationTest
	
	def setup
		@chef = Chef.create!(chefsname: "manko", email: "manko@recipes.com",
													password: "password", password_confirmation: "password")
	end

  test "reject an invalid edit" do
  	get edit_chef_path(@chef)
  	assert_template 'chefs/edit'
  	patch chef_path(@chef), params: {chef: {chefsname: " ", email: "chefsname@eascipes.com"} }
  	assert_template 'chefs/edit'
		assert_select 'div.card-header'
		assert_select 'div.card-body'
  end

  test "accept valid edit" do
  	get edit_chef_path(@chef)
  	assert_template 'chefs/edit'
  	patch chef_path(@chef), params: {chef: {chefsname: "chefname", email: "chefsname@eascipes.com"} }
  	assert_redirected_to @chef
  	assert_not flash.empty?
  	@chef.reload
  	assert_match "chefname", @chef.chefsname
  	assert_match "chefsname@eascipes.com", @chef.email
  end


end
