source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails',                   '~> 5.1.1'
gem 'puma',                    '~> 4.3'
gem 'sassc-rails'
gem 'uglifier',                '>= 1.3.0'
gem 'coffee-rails',            '~> 4.2'
gem 'turbolinks',              '~> 5'
gem 'jbuilder',                '~> 2.5'
gem 'faker',                   '1.7.3'
gem 'will_paginate',           '3.1.6'
gem 'bootstrap-will_paginate', '1.0.0'
gem 'carrierwave',             '1.2.2'
gem 'mini_magick',             '4.7.0'
gem 'sprockets',               '~> 3.0'
gem 'mysql2'


group :development, :test do
  gem 'rspec-rails', '~> 3.9.0'
  gem 'factory_bot_rails', '~>4.10.0'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'selenium-webdriver', '~> 3.4.1'
end

group :test do
  gem 'capybara',  '~> 2.15.2'
  gem 'webdrivers'
  gem 'launchy',   '~> 2.4.3'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'spring-commands-rspec'
end

group :production, :staging do
    gem 'unicorn'
end

group :production do
  gem 'fog', '1.42'
end

gem 'bootstrap-sass'
gem 'jquery-rails'
gem 'devise'
gem 'geocoder'

