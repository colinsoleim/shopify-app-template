# Shopify App Template

This is a template repository to build shopify apps for the Shopify App Store.

## How to install?

1. Create a new repo from the template
2. Git clone the new repo
3. Replace `shopify-app-template`, `shopify_app_template` and `ShopifyAppTemplate` with your new project's name
2. `bundle install`
3. `bundle exec rails db:create db:migrate`
4. Install and run [Redis](https://redis.io/download)
5. Install [ngrok](https://ngrok.com/)
6. `~/ngrok http 3000`
7. `rails s`
8. If installation was successful, going to `http://localhost:3000` should give you the Shopify installation window.

## Contributing

Bug reports and pull requests are welcome on GitHub. This project is
intended to be a safe, welcoming space for collaboration, and contributors are
expected to adhere to the
[Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the
[MIT License](https://opensource.org/licenses/MIT).
