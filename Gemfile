source 'https://rubygems.org'
ruby '2.4.0'

## Base server components
# Use Rails
gem 'rails', '~> 5.0.1'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use Postgres as the app database
gem 'pg'
# Use Redis as the app cache
gem 'redis', '~> 3.0'
# Use Sidekiq as the background worker
gem 'sidekiq'

## Back end components
# Use Jbuilder for JSON APIs
gem 'jbuilder', '~> 2.5'
# Use redis-objects to interact with Redis
gem 'redis-objects'
# Use Devise and Warden for authentication
gem 'devise'
gem 'warden'
# Use Paperclip for storing file attachments
gem "paperclip", "~> 5.0.0"
# Use Cocoon for nested forms
gem 'cocoon'
# Rack-attack for rate limiting
gem 'rack-attack'


## Front end components
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Boostrap for the framework
gem 'bootstrap-sass', '~> 3.3.6'
gem 'bootstrap_form'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use jQuery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# jQuery UI components
gem 'jquery-ui-rails'
gem 'jquery-minicolors-rails'

## Misc
# Dotenv for storing environment variables
gem 'dotenv-rails'
# Slack notifier for notifications
gem 'slack-notifier'
# Rollbar for error tracking and reporting
gem 'rollbar'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  # Letter opener for testing mailers
  gem 'letter_opener'
  # Use sqlite3 as the database
  gem 'sqlite3'
  # Rubocop for style guide enforcement
  gem 'rubocop'
  # Rails Best Practices analyzer
  gem 'rails_best_practices'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
