require 'test_helper'

class PagesTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  test "should get home" do
  #   assert true
  	get pages_home_url 		#pages(controller), home(action)
  	assert_response :success
  # end
	end

	test "should get root" do
		get root_url
		assert_response :success
	end
end
