source 'https://rubygems.org'
ruby '2.3.0'

gem 'rails', '5.0.0.1'

# Use postgresql as the database for Active Record
gem 'pg', '~> 0.15'

# JSON API views
gem 'jbuilder', '~> 2.5'

# BE gems
gem 'finance'

# FE gems
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'bootstrap-sass'
gem 'backbone-on-rails'
gem 'handlebars_assets'

# Application server
gem 'puma', '~> 3.0'

# Heroku deployment
gem "rack-timeout"
gem 'rails_12factor', group: :production

# Util
gem 'awesome_print'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'rspec-rails'
  gem 'faker'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
end

group :development do
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
