# A service to sync some or all Products between two different shops
# ProductBuilder.call(
#  shop_id: 1,
#  product_title: "New Product",
# )

class ProductBuilder
  include Service

  def call
    shop = Shop.find(options[:shop_id])
    shop.activate_shopify_session
    product_title = options[:product_title]

    ShopifyAPI::Product.create(
      title: product_title,
    )
  end
end
