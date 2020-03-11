require 'test_helper'

class ChefTest < ActiveSupport::TestCase

	def setup
		@chef = Chef.new(chefsname: "John", email: "john@recipes.com",
										 password: "password", password_confirmation: "password")
	end

	test "chef should be valid" do 
		assert @chef.valid?
	end

	test "chefname should be present" do
		@chef.chefsname = ""
		assert_not @chef.valid?
	end

	test "chefsname should be less than 30 characters" do
		@chef.chefsname = "a" * 31
		assert_not @chef.valid?
	end

	test "email should be present" do
		@chef.email = ""
		assert_not @chef.valid?
	end

	test "email should not be too long" do
		@chef.email = "a" * 245 + "recipes.com"
		assert_not @chef.valid?
	end

	test "email should accept correct format" do
		valid_emails = %w[user@recipes.com user2@ex.com]
		valid_emails.each do |valids|
			@chef.email = valids
			assert @chef.valid?, "#{valids.inspect} should be valid"
		end
	end

	test "should reject invalid email addresses" do
		invalid_emails = %w[mash@ex mash@ex,com user@ex.]
		invalid_emails.each do |invalids|
			@chef.email = invalids
			assert_not @chef.valid?, "#{invalids.inspect} should be invalid"
		end
	end

	test "email should be case insensitive" do
		@chef.email = @chef.email.upcase
		@chef.save
		assert @chef.valid?
	end

	test "email should be unique" do
		dup_chef = @chef.dup
		dup_chef.email = @chef.email.upcase
		@chef.save
		assert_not dup_chef.valid?
	end

	test "email should be lower case before hitting the db" do
		mixed_email = "JOHN@ex.com"
		@chef.email = mixed_email
		@chef.save
		assert_equal mixed_email.downcase, @chef.reload.email
	end

	test "password should be present" do
		@chef.password = @chef.password_confirmation = ""
		assert_not @chef.valid?
	end

	test "password should be atleast 8 character long" do
		@chef.password = @chef.password_confirmation = "x" * 7
		assert_not @chef.valid?
	end

	test "password should be more than 8 character long" do
		@chef.password = @chef.password_confirmation = "x" * 8
		assert @chef.valid?
	end
	test "password should be less than 26 character long" do
		@chef.password = @chef.password_confirmation = "x" * 26
		assert_not @chef.valid?
	end

	test "password should be max 25 character long" do
		@chef.password = @chef.password_confirmation = "x" * 25
		assert @chef.valid?
	end
end
