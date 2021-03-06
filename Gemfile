source 'https://rubygems.org'

ruby '2.3.0'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5'
# For styling
gem 'bootstrap-sass', '~>3.3.4.1'
gem 'autoprefixer-rails', '~>5.2.0'

# Use devise for authentication via HTTP and JSON API
gem 'devise', '~>3.5.1'
# Use omniauth to work with Facebook and Google login
gem 'omniauth'
# Used to create and authenticate against a token via JSON mobile
gem 'simple_token_authentication'
# Used to login using Facebook
gem 'omniauth-facebook'
# Used to login using Google
gem "omniauth-google-oauth2"
# Used to allow voting
gem 'acts_as_votable', '~> 0.10.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# for contact us page
gem 'mail_form'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Pagination
gem 'will_paginate', '3.0.7'
gem 'bootstrap-will_paginate', '0.0.10'

# Image Upload
gem 'carrierwave', '0.10.0'
gem 'mini_magick','3.8.0'
# Production Image Handling
gem 'fog', '1.37.0'

# Friendly URLS
gem 'friendly_id', '~> 5.1.0'

gem 'simple_form'
gem 'cocoon'
gem 'selectize-rails'
gem 'simple_form_extension'

# Solr Sunspot is the search functionality for the application.
#gem 'sunspot_rails'
#gem 'sunspot_solr' # optional pre-packaged Solr distribution for use in development

# For handling custom error pages
# gem 'exception_handler'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development



group :development, :test do
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'
  gem 'rspec-rails', '3.2.3'
  gem 'guard-rspec', require: false
  gem 'spring-commands-rspec'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  
group :test do
  gem 'capybara', '2.4.4'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

end


gem 'redactor-rails', github: 'glyph-fr/redactor-rails'