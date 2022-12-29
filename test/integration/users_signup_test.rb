require "test_helper"

class UsersSignupTest < ActionDispatch::IntegrationTest
  
	test "invalid signup information" do
	  	get signup_path
	  	assert_no_difference 'User.count' do
	  		post users_path, params: 	{ user: { name:  "",
					                                 email: "user@invalid",
					                                 password:              "foo",
					                                 password_confirmation: "bar" } } 
		end

		assert_reponse :unprocessable_entity
		assert_template 'users/new'
	end

	test "valid signup information" do
		assert_difference 'User.count', 1 do
			post users_path, params: { user: {name: "abcdefght dfs",
																				email: "abcd1223@example.com", 
																				password: "abcd1223",
																				password_confirmation: "abcd1223" } }
		end

		follow_redirect!
		assert_template 'users/show'
		assert is_logged_in?
	end

end
