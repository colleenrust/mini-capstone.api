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
    assert_equal ["id", "name", "price",  "description", "created_at", "updated_at", "is_discounted?", "tax", "total"], data.keys
  end
  # Update your test file to include a create test with body params:
  test "create" do
    assert_difference “Product.count”, 1 do
      post “/products.json”, params: { name: “test_product”, price: 1, image_url: “image.jpg”, description:“test_description”}
    end
  end
  assert_equal ["created_at", "id", "price", "description", "name", "is_discounted?", "tax", "total", "quantity", "supplier", "images", "categories"], data.keys

  # test "update" do
  #   product = Product.first
  #   patch "/products/#{product.id}.json", params: {name: "Updated title"}
  
  #   assert_response 200

  #   data = JSON.parse(response.body)
  #   assert_equal "Updated name", data["name"]
  # end
  # test "destroy" do
  #   assert_difference "Product.count", -1 do
  #     delete "/products/#{Product.first.id}.json"
  #     assert_response 200
  #   end
  # end
end
