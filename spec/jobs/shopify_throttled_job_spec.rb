require "rails_helper"
require "sidekiq/api"

describe ShopifyThrottledJob, type: :job do
  describe "#perform_async" do
    context "for a valid service class and shop" do
      before(:each) do
        @shop = create(:shop)
        @shop.activate_shopify_session
      end

      it "should call the service object" do
        Sidekiq::Testing.inline! do
          allow(ProductBuilder).
            to receive(:call).
            with(shop_id: @shop.id, product_title: "Product Title")

          ShopifyThrottledJob.perform_async(
            service: "ProductBuilder",
            args: MultiJson.dump(
              shop_id: @shop.id,
              product_title: "Product Title",
            ),
          )

          expect(ProductBuilder).to have_received(:call)
        end
      end
    end

    context "for an invalid service class" do
      it "should return a NoMethodError" do
        Sidekiq::Testing.inline! do
          expected = expect do
            ShopifyThrottledJob.perform_async(
              service: "InvalidService",
              args: MultiJson.dump(shop_id: 0),
            )
          end

          expected.to raise_error NoMethodError
        end
      end
    end
  end
end
