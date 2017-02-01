# README

## Table Structures
User
- email
- password_digest
- first_name
- last_name
- current_city
- prof_photo (add using CarrierWave)
* has_many posts
* has_many comments

City
- city_name (SF, London, Gibraltar)
- photo
* has_many posts

Post
- title
- content
* belongs_to city
* belongs_to user
* has_many comments

Comment
- content
* belongs_to post
* belongs_to user


Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
