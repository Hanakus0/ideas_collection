source "https://rubygems.org"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.2.1"
# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"
# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"
# Use the Puma web server [https://github.com/puma/puma]
gem "puma", ">= 5.0"
# Bundle and transpile JavaScript [https://github.com/rails/jsbundling-rails]
gem "jsbundling-rails"
# Hotwire"s SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"
# Hotwire"s modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"
# Bundle and process CSS [https://github.com/rails/cssbundling-rails]
gem "cssbundling-rails"
# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"
# Use Redis adapter to run Action Cable in production
# gem "redis", ">= 4.0.1"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ windows jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# -- added gem ---
gem "devise", "~> 4.9"
gem "rails-i18n", "~> 7.0.0"
gem "devise-i18n", "~> 1.12", ">= 1.12.1"
gem "enum_help"
gem "draper"
gem "kaminari", "~> 1.2", ">= 1.2.2"
gem "meta-tags", "~> 2.22", ">= 2.22.1"
gem "rambulance", "~> 3.1"
# aws s3 with carrierwave
gem "carrierwave", "~> 3.0"
gem "fog-aws", "~> 3.29"
# For GoogleOauth2 gems
gem "omniauth"
gem "omniauth-rails_csrf_protection"
gem "omniauth-google-oauth2"


group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"

  # Static analysis for security vulnerabilities [https://brakemanscanner.org/]
  gem "brakeman", require: false

  # Omakase Ruby styling [https://github.com/rails/rubocop-rails-omakase/]
  gem "rubocop-rails-omakase", require: false

  # -- added gem ---
  # env value
  gem "dotenv"
  # RSpec test
  gem "rspec-rails", "~> 7.1"
  gem "factory_bot_rails", "~> 6.4", ">= 6.4.4"
  gem "faker", "~> 3.5", ">= 3.5.1"
  gem "omochi", "~> 0.1.0"
  gem "simplecov", "~> 0.22.0"
  gem "pry-rails", "~> 0.3.11"
  # search N+1 problem
  gem "bullet"
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"
  # Add [https://qiita.com/rakuma_devrel/items/0f1d176358cb30cb35f0]
  gem "better_errors"
  gem "binding_of_caller"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
  gem "capybara-email"
  gem "email_spec"
end
