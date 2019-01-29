source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.5'
# Use Postgres as the database for Active Record
gem 'pg', '~> 1.0.0'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '~> 2.7', '>= 2.7.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

gem 'dotenv-rails', '~> 2.1', '>= 2.1.1'

gem 'jquery-datatables'

gem 'loofah', '>= 2.2.2'

gem 'devise'

gem 'sidekiq'
gem 'sinatra', github: 'sinatra/sinatra'
gem 'sidekiq-cron'

gem 'tzinfo', '~> 1.2', '>= 1.2.5'

gem 'friendly_id', '~> 5.2.0'
gem "font-awesome-rails"

gem 'twitter', '~> 6.2'

gem 'jquery-rails', '~> 4.3', '>= 4.3.1'

gem 'bootstrap', '~> 4.1.2'
gem 'autoprefixer-rails'

gem 'gon'

gem 'high_voltage', '~> 3.0.0'

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'

gem 'httparty', '~> 0.13.7'

gem "ranker"

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
