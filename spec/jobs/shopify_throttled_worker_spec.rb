require "rails_helper"
require "sidekiq/testing"
require "sidekiq/api"
Sidekiq::Testing.fake!

describe ShopifyThrottledWorker, type: :job do
  describe "#throttled?" do
    context "when limit exceeded" do
      it "should be throttled" do
        Sidekiq::Testing.disable! do
          shop = create(:shop)
          shop.activate_shopify_session

          expect {
            10.times do
              ShopifyThrottledWorker.perform_async(
                service: "ProductBuilder",
                args: MultiJson.dump(
                  shop_id: shop.id,
                  product_title: "New Product",
                ),
              )
            end
          }.to change(Sidekiq::Queue.new, :size).by(10)
        end
      end
    end
  end

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

          ShopifyThrottledWorker.perform_async(
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
            ShopifyThrottledWorker.perform_async(
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
