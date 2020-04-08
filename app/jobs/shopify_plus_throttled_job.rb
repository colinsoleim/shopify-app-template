# An example of usage
# ShopifyPlusThrottledWorker.perform_async(
#   service: "ServiceClass",
#   args: MultiJson.dump(shop_id: shop.id, product_title: "Title")
# )

class ShopifyPlusThrottledJob
  include Sidekiq::Worker

  EXCEPTIONS = [
    ActiveResource::UnauthorizedAccess,
    ActiveResource::ForbiddenAccess,
  ].freeze

  sidekiq_options queue: :shopify_plus,
                  rate: {
                    name: "shopify_plus_rate_limit",
                    limit: 4,
                    period: 1,
                  }

  def perform(options)
    options["service"].safe_constantize.call(
      MultiJson.load(options["args"]).deep_symbolize_keys,
    )
  end
end
