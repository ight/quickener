# Quickener
This is a sample application created for creating
a reservation, updating it and listing all the
reservation for a restourant.

### Tech Stack for Quickener
- Ruby 2.5.1
- Rails 5.2.2
- Postgresql 10

## Setting up Quickener
- Git Clone
  [Quickener] (https://github.com/ight/quickener.git)
  `git clone`

- Change .yml.sample to .yml inside config folder
  example: `cp database.yml.sample database.yml`

- Install the gems
  `bundle install`

- Setup data base and populate it with seeds data
  ```
  rake db:create
  rake db:migrate
  rake db:seed
  ```
- Genrating the swagger docs
  `rake swagger:docs`

- Run test cases
  `rake test`

- Start rails server
  `rails s -p 5000`

- Vist localhost:5000

