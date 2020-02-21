require "rails_helper"

describe ProductBuilder do
  describe "#call" do
    context "with a shop_id and product_title" do
      it "creates a new product" do
        shop = create(:shop)
        shop.activate_shopify_session

        ProductBuilder.call(shop_id: shop.id, product_title: "New Product")
        expect(WebMock).to have_requested(
          :post,
          "https://domain.myshopify.com/admin/api/2019-04/products.json",
        ).once
      end
    end
  end
end
