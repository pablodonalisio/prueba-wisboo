# README

## Ruby version
  `2.7.2`

## Configuration

  To get a local copy of the API clone the repo with

  `git@github.com:pablodonalisio/prueba-wisboo.git`

  and install dependencies with

  `bundle install`

  and you're good to go.

## Database creation

  To create databases use

  `rails db:setup`

  Then run migrations

  `rails db:migrate`

## Postman

  You can test the API in a local server with this Postman collection

  [![Run in Postman](https://run.pstmn.io/button.svg)](https://app.getpostman.com/run-collection/0d768b42066f6ee50d2b?action=collection%2Fimport)


## Usage
### GET /products

Returns a list of all products.

Query params:

- query: filter by product name
- currency: filter by currency
- page: number of page you want to see
- size: number of products by page

## Tests

  To run tests 

  `bundle exec rspec`