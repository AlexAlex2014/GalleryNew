source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.5'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.3'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

gem 'figaro'

gem 'twitter-bootstrap-rails'

gem 'i18n', '~> 1.6'
gem 'rails-i18n'
gem 'bootstrap-sass', '~> 3.4', '>= 3.4.1'
gem 'popper_js', '~> 1.14.5'
gem 'haml-rails', '~> 2.0', '>= 2.0.1'
gem 'carrierwave', '~> 1.3', '>= 1.3.1'
gem 'fog-aws', '~> 3.5', '>= 3.5.2'
gem 'mini_magick'
gem 'file_validators'
gem 'devise', '~> 4.6', '>= 4.6.2'
gem 'activeadmin', '~> 2.1'
gem 'kaminari', '~> 1.1', '>= 1.1.1'
gem 'friendly_id', '~> 5.2', '>= 5.2.5'
gem 'nokogiri', '~> 1.10'
gem 'omniauth', '~> 1.9'
gem 'omniauth-facebook'
gem 'redis'
gem 'redis-namespace'
gem 'resque', require: 'resque/server'
gem 'resque-web', require: 'resque_web'
gem 'pusher', '~> 1.3', '>= 1.3.3'
gem 'recaptcha', '~> 5.0'

gem 'execjs'



group :development, :test do
  gem 'rspec', '~> 3.8'
  gem 'rspec-rails', '~> 3.8', '>= 3.8.2'
  gem 'rails-controller-testing', '~> 1.0', '>= 1.0.4'
  gem 'rubocop', '~> 0.72.0'
  gem 'rubocop-rspec'
  gem 'simplecov', require: false, group: :test
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :test do
  gem 'database_cleaner'
  gem 'factory_bot_rails', '~> 5.1'
  gem 'capybara', '~> 3.25'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers', '~> 4.1', '>= 4.1.2'
  gem 'chromedriver-helper'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  gem 'capistrano'
  # gem 'capistrano3-puma'
  gem 'capistrano-bundler'
  gem 'capistrano-passenger', '>= 0.1.1'
  gem 'capistrano-rails'
  gem 'capistrano-rvm'
  gem 'capistrano-figaro-yml', '~> 1.0.2'
end


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
