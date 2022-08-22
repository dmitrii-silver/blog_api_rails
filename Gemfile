source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.0"

gem "rails", "~> 7.0.3", ">= 7.0.3.1"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "jbuilder"
gem "bcrypt", "~> 3.1.7"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false
gem "active_model_serializers"
gem "will_paginate"
gem "rack-cors"
gem "devise"
gem "devise_token_auth", git: "https://github.com/lynndylanhurley/devise_token_auth"
gem "carrierwave"
gem "rmagick"
gem "dotenv-rails"
gem "fog"
gem "fog-aws"

# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "rspec-rails"
end

group :test do
  gem "factory_bot_rails"
  gem "database_cleaner"
  gem "faker", :git => 'https://github.com/faker-ruby/faker.git', :branch => 'master'
  gem 'shoulda-matchers', '~> 5.0'
end

group :development do
  # gem "spring"
end

