source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.1"

gem "rails", "~> 7.0.4", ">= 7.0.4.3"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "tailwindcss-rails"
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
gem "bootsnap", require: false
gem "foreman"

gem "inline_svg"
gem 'simple_form', git: 'https://github.com/loqimean/simple_form'
gem "monopay-ruby", git: 'https://github.com/loqimean/monopay-ruby', branch: 'feature/ability_to_apply_coupon_for_price'

gem "pry"

gem "elasticsearch-model"
gem "elasticsearch-rails"
gem "elasticsearch-persistence"

group :development, :test do
  gem "debug", platforms: %i[mri mingw x64_mingw]
  gem "faker"
  gem "factory_bot_rails"
  gem "rspec-rails", ">= 6.0.0"
  gem "shoulda-matchers", "~> 5.0"
  gem "rails-controller-testing"
  gem 'dotenv-rails'
end

group :development do
  gem "web-console"
  gem 'any_login'
end

gem "devise", "~> 4.9"
