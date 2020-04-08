# Consult this page for more scope options:
# https://help.shopify.com/en/api/getting-started/authentication/oauth/scopes

ShopifyApp.configure do |config|
  config.application_name = "My Shopify App"
  config.api_key = ENV["SHOPIFY_API_KEY"]
  config.secret = ENV["SHOPIFY_API_SECRET"]
  config.old_secret = ""
  config.embedded_app = false
  config.after_authenticate_job = false
  config.api_version = "2019-04"
  config.shop_session_repository = "Shop"

  config.scope = ""

  # Access to Article, Blog, Comment, Page, and Redirect.
  config.scope += "read_content, write_content,"
  # Access to Asset and Theme.
  config.scope += "read_themes, write_themes,"
  # Access to Product, Product Variant, Product Image, Collect, Custom Collection, and Smart Collection.
  config.scope += "read_products, write_products,"
  # Access to Product Listing, and Collection Listing.
  config.scope += "read_product_listings,"
  # Access to Customer and Saved Search.
  config.scope += "read_customers, write_customers,"
  # Access to Abandoned checkouts, Fulfillment, Order, and Transaction.
  config.scope += "read_orders, write_orders,"
  # Grants access to all orders rather than the default window of 60 days worth of orders. This OAuth scope is used in conjunction with read_orders, or write_orders. You need to request this scope from your Partner Dashboard before adding it to your app.
  # config.scope += "read_all_orders,"
  # Access to Draft Order.
  config.scope += "read_draft_orders, write_draft_orders,"
  # Access to Inventory Level and Inventory Item.
  config.scope += "read_inventory, write_inventory,"
  # Access to Location.
  config.scope += "read_locations,"
  # Access to Script Tag.
  config.scope += "read_script_tags, write_script_tags,"
  # Access to Fulfillment Service.
  config.scope += "read_fulfillments, write_fulfillments,"
  # Access to FulfillmentOrder resources assigned to a location managed by your fulfillment service.
  config.scope += "read_assigned_fulfillment_orders, write_assigned_fulfillment_orders,"
  # Access to FulfillmentOrder resources assigned to merchant-managed locations.
  config.scope += "read_merchant_managed_fulfillment_orders, write_merchant_managed_fulfillment_orders,"
  # Access to FulfillmentOrder resources assigned to a location managed by any fulfillment service.
  config.scope += "read_third_party_fulfillment_orders, write_third_party_fulfillment_orders,"
  # Access to Carrier Service, Country and Province.
  config.scope += "read_shipping, write_shipping,"
  # Access to Analytics API.
  config.scope += "read_analytics,"
  # Access to User SHOPIFY PLUS.
  # config.scope += "read_users, write_users,"
  # Access to Checkouts.
  config.scope += "read_checkouts, write_checkouts,"
  # Access to Reports.
  config.scope += "read_reports, write_reports,"
  # Access to Price Rules.
  config.scope += "read_price_rules, write_price_rules,"
  # Access to GraphQL Admin API Discounts features.
  config.scope += "read_discounts, write_discounts,"
  # Access to Marketing Event.
  config.scope += "read_marketing_events, write_marketing_events,"
  # Access to ResourceFeedback.
  config.scope += "read_resource_feedbacks, write_resource_feedbacks,"
  # Access to the Shopify Payments Payout, Balance, and Transaction resources.
  config.scope += "read_shopify_payments_payouts,"
  # Access to the Shopify Payments Dispute resource.
  config.scope += "read_shopify_payments_disputes,"
  # Access to Translatable Resource.
  config.scope += "read_translations, write_translations,"
  # Access to Shop Locale.
  config.scope += "read_locales, write_locales,"
end
