source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.4"

gem "rails", "~> 7.0.4"

gem "bcrypt", "~> 3.1.7"
gem "bootsnap", require: false
gem "puma", "~> 5.0"
gem "rack-cors"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem 'devise', '~> 4.8', '>= 4.8.1'
gem 'draper', '~> 4.0', '>= 4.0.2'
gem 'faraday', '~> 2.7', '>= 2.7.2'
gem 'has_scope', '~> 0.8.0'
gem 'kaminari', '~> 1.2', '>= 1.2.2'
gem 'mongoid', '~> 8.0', '>= 8.0.3'
gem 'sidekiq', '~> 7.0', '>= 7.0.3'
gem 'yard', '~> 0.9.28'

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem 'rubocop', '~> 1.43'
  gem 'rubocop-performance', '~> 1.15', '>= 1.15.2'
  gem 'rubocop-rails', '~> 2.17', '>= 2.17.4'
  gem 'rubocop-rspec', '~> 2.17'
end

group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  gem "spring"
end
