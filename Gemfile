source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.2", ">= 7.0.2.3"

# Use mysql as the database for Active Record
gem 'mysql2', '~> 0.5.3'

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.0"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# for pagination 
gem 'kaminari', '~> 1.1'

# Create json formed response 
gem 'active_model_serializers', '~> 0.10.13'

# Map controller parameter to model scope
gem 'has_scope', '~> 0.7.1'

# paginate in header, not in response body
gem 'api-pagination', '~> 3.0'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem 'pry-byebug', '~> 3.9'
end
