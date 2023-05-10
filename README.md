# Jungle

A mini e-commerce application built with Rails 6.1 for purposes of teaching Rails by example. This was not built from me from scratch. I fixed bugs and added features as listed below as well as developed RSpec tests.

## Features Added

  - "Sold Out" badge for out of stock products
  - Admin Page for adding new product categories
  - Admin dashboard for reviewing categories and products in database
  - Order details at checkout with order confirmation message
  - Login and Signup pages with user authetification

## Bugs Fixed

  - Money formatting fix to show '$' signs when pertaining to currency
  - Fixed http authentification for administrators
  - Fixed empty cart checkout

## RSpec Testing

  - Validation of fields for user forms with authentification
  - Validation of fields for adding additional products

## Screenshots

  Product Index View

  !["Screenshot Product Index"](https://github.com/7-O-2-H/jungle/blob/master/docs/Main%20Page%20-%20Products%20Index.png)

  Product Show Page

  !["Product View"](https://github.com/7-O-2-H/jungle/blob/master/docs/Product%20Show%20Page.png)

  Checkout Page

  !["Checkout Page"](https://github.com/7-O-2-H/jungle/blob/master/docs/Checkout%20Page.png)

  Sold Out Button

  !["Sold Out Button"](https://github.com/7-O-2-H/jungle/blob/master/docs/Out%20of%20Stock%20Example.png)



  
## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe
