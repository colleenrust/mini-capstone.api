require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/products.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Product.count, data.length
  end
  test "show" do
    get "/products/#{Product.first.id}.json"
    assert_response 200
  
    data = JSON.parse(response.body)
    assert_equal ["id", "name", "price", "image_url", "description", "created_at", "updated_at"], data.keys
  end
  # Update your test file to include a create test with body params:
  test "create" do
    assert_difference “Product.count”, 1 do
      post “/products.json”, params: { name: “test_product”, price: 1, image_url: “image.jpg”, description:“test_description”}
    end

  end
  test "update" do
    product = Product.first
    patch "/products/#{product.id}.json", params: {name: "Updated title"}
  
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated name", data["name"]
  end
end
