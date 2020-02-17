require "rails_helper"

describe Shop do
  describe "#activate_shopify_session" do
    it "activates a shopify session" do
      @shop = create(:shop)
      @shop.activate_shopify_session
      expect(ShopifyAPI::Shop.current).to be_a(ShopifyAPI::Shop)
    end
  end
end
