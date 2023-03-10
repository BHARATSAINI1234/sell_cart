require "test_helper"

class UserTest < ActiveSupport::TestCase
	def setup
		@user = User.new(name: "example user", email:"nmae@example.com", 
										password: "example1234", password_confirmation: "example1234")
	end

	test "should be valid?" do
		assert @user.valid?
	end

	test "name should be present" do
		@user.name = "     "
		assert_not @user.valid?
	end

	test "email should be present" do
		@user.email = "   " 
		assert_not @user.valid?
	end

	test "name should not be too long" do
		@user.name = "a" * 20
		assert_not @user.valid?
	end

	test "email should not be too long" do
		@user.email = "a" * 100 + "@example.com"
		assert_not @user.valid?
	end

	test "email should be valid address" do
 		valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do|address|
    	@user.email = address
    	assert @user.valid?, "#{address.inspect} should be valid"
    end
  end

  test "email should be invalid address" do
 		invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do|address|
    	@user.email = address
    	assert_not @user.valid?, "#{address.inspect} should be invalid"
    end
  end

  test "email should be unique" do
  	duplicate_user = @user.dup
  	@user.save
  	assert_not duplicate_user.valid?
  end


  test "password should be present"
  	@user.password = @user.password_confirmation = " " * 6
  	assert_not @user.valid?
  end

  test "password should be minimum"
  	@user.password = @user.password_confirmation = "a" * 5
   	assert_not @user.valid?
 	end
 

end
