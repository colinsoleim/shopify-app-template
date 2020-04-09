Rails.application.routes.draw do
  mount ShopifyApp::Engine, at: "/"
  root to: "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
