class Shop < ApplicationRecord
  include ShopifyApp::ShopSessionStorage

  def api_version
    ShopifyApp.configuration.api_version
  end

  def activate_shopify_session
    session = ShopifyAPI::Session.new(
      domain: shopify_domain,
      token: shopify_token,
      api_version: api_version,
    )
    ShopifyAPI::Base.activate_session(session)
  end
end
