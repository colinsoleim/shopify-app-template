# An example of usage
# ShopifyThrottledWorker.perform_async(
#   service: "ServiceClass",
#   args: MultiJson.dump(shop_id: shop.id, product_title: "Title")
# )

class ShopifyThrottledJob
  include Sidekiq::Worker

  EXCEPTIONS = [
    ActiveResource::UnauthorizedAccess,
    ActiveResource::ForbiddenAccess,
  ].freeze

  sidekiq_options queue: :shopify,
                  rate: {
                    name: "shopify_standard_rate_limit",
                    limit: 2,
                    period: 1,
                  }

  def perform(options)
    options["service"].safe_constantize.call(
      MultiJson.load(options["args"]).deep_symbolize_keys,
    )
  end
end
