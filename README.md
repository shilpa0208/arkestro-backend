# Arkestro backend

A rails application that is used to demonstrate how a logged in user can view a table that contains deeply nested serialized records where various attributes on those records can be updated and persisted to the postgresql database.

Prerequisites:
* Ruby version: 3.1.0
* Rails version: 7.1.3

Setup:

1. Clone the repo.
2. Run `bundle install` to install all dependencies.
3. Run `rake db:migrate` to run all the migrations.
4. To seed the db, run `rake db:seed`
5. To start the app run `rails s -p 3001`
