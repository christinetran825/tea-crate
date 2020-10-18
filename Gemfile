source 'http://rubygems.org'
ruby '2.5.0'

# gem 'pg', '~> 0.20', :group => :production
gem 'sinatra'
gem 'activerecord', '~> 4.2', '>= 4.2.6', :require => 'active_record'
gem 'sinatra-activerecord', :require => 'sinatra/activerecord'
gem 'rake'
gem 'require_all'
# gem 'sqlite3', :group => :development
gem 'thin'
gem 'shotgun'
gem 'pry'
gem 'bcrypt'
gem "tux"
gem 'rack-flash3'
gem "rack", ">= 2.1.4"

group :production, :staging do
  gem "pg", '~> 0.20'
  gem 'rails_12factor'
end

group :development, :test do
  gem "sqlite3"
end

group :test do
  gem 'rspec'
  gem 'capybara'
  gem 'rack-test'
  gem 'database_cleaner', git: 'https://github.com/bmabey/database_cleaner.git'
end
