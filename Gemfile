source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.3.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.0'
# Use postgresql as the database for Active Record
gem 'pg'
# Use Puma as the app server
gem 'puma'
gem 'dotenv-rails' # to handle .env files
gem 'sd_notify', '~> 0.1.0' # hotfix not actually used
# Use SCSS for stylesheets
gem 'sass-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'terser'
# gem 'uglifier'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap'

gem 'figaro'

gem 'twitter-bootstrap-rails'

gem 'i18n'
gem 'rails-i18n'
gem 'bootstrap-sass'
gem 'popper_js'
gem 'haml-rails'
gem 'carrierwave'
# gem 'fog-aws'
gem 'mini_magick'
gem 'file_validators'
gem 'devise'
gem 'activeadmin'
gem 'kaminari'
gem 'friendly_id'
gem 'nokogiri'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'redis'
gem 'redis-namespace'
gem 'resque', require: 'resque/server'
gem 'resque-web', require: 'resque_web'
gem 'pusher'
gem 'recaptcha'

gem 'execjs'

group :development, :test do
  gem 'rspec'
  gem 'rspec-rails'
  gem 'rails-controller-testing'
  gem 'rubocop'
  gem 'rubocop-rspec'
  gem "letter_opener", group: :development
  gem 'simplecov', require: false, group: :test
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :test do
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers'
  gem 'chromedriver-helper'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console'
  gem 'listen'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen'
  gem 'capistrano'
  # gem 'capistrano3-puma', github: "seuros/capistrano-puma"
  gem 'capistrano3-puma', '6.0.0.beta.1'
  # gem 'capistrano-bundler'
  # gem 'capistrano-passenger'
  gem 'capistrano-rails'
  gem "capistrano-rvm"
  # gem 'capistrano-figaro-yml'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
