require "test_helper"

class ProductControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_path
    assert_response :success
  end

  test "can't delete product in cart" do
		assert_difference('Product.count', 0) do
			delete product_url(products(:two))
		end
		assert_redirected_to products_url
 	end

	test "should destroy product" do
		assert_difference('Product.count', -1) do
			delete product_url(@product)
		end
		assert_redirected_to products_url
	end
end


