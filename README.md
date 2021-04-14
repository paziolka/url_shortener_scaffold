### What is it?

It's a rails application that takes a URL and returns a shortened URL. When a user visits the shortened URL, they are redirected to the full URL. Each time a shortened URL is accessed, the application updates statistics regarding the URL. The user can view statistics of any kind and export it to CSV format.

It's not a finished code - just a scaffold that shows the general architecture and usage of form and service objects pattern.

### How to run it?

* Ruby version: `2.7`, covered by `.ruby-version`

* System dependencies and configuration: covered by `.ruby-gemset`. To install run `bundle install`

* Database creation `rake db:create`

* How to run the test suite: `rspec`

* How to run the rubocop checks: `rubocop`
