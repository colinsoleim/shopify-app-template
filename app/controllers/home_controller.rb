# frozen_string_literal: true

# class HomeController < AuthenticatedController
class HomeController < ApplicationController
  def index
    @products = [] # ShopifyAPI::Product.all.first(10)
  end
end
