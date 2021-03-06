# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.

This is a small individual project where I added the following features:
- Implemented a product sold out badge
- Allow administrators to create products, but not categories
- Added common functionality of user authentication
- Changed the Order Show page to contain name, image and description, the respective quantities, total and email that was used
- Added an email-receipt which can be seen from the console
- Provided security accessing Administrator pages
- Implemented product ratings, where each logged in user is able to post and rate a review on a product as well as view the average rating on each item


!["Index Page"](https://github.com/bernicetann/jungle-rails/blob/master/docs/Sold-out-badge.png?raw=true)


!["Reviews Page"](https://github.com/bernicetann/jungle-rails/blob/master/docs/Reviews-page.png?raw=true)


!["Carts Page"](https://github.com/bernicetann/jungle-rails/blob/master/docs/My-cart-page.png?raw=true)


!["Order Page"](https://github.com/bernicetann/jungle-rails/blob/master/docs/Order-page.png?raw=true)


## Setup

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rake db:reset` to create, load and seed db
6. Create .env file based on .env.example
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate .env vars
9. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
