source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'
gem 'jquery-rails', '4.3.3'
gem 'fullcalendar-rails'
gem 'momentjs-rails'
gem 'bootstrap', '~> 4.3.1'
gem 'data-confirm-modal'
gem 'devise'
gem 'font-awesome-rails'
gem 'carrierwave'
gem 'mini_magick'
gem 'ransack'
gem 'rails-i18n'
gem 'faker'


gem 'rails', '~> 5.2.3'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.3'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.1.0', require: false


gem 'dotenv-rails' # 開発環境で環境変数を操作するのに必要
gem 'unicorn' # アプリケーションサーバのunicorn
gem 'mini_racer', platforms: :ruby # デプロイ時に必要



group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  gem 'capistrano', '3.6.0' # capistranoのツール一式
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
  gem 'capistrano3-unicorn'

end

group :development do
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'pry-doc'
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'rspec-rails'
  gem 'spring-commands-rspec'
  gem 'capybara'
  gem 'launchy'

  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
  gem 'capistrano-bundler'
  gem 'capistrano-yarn'
  gem 'capistrano-passenger', '>= 0.1.1'
  gem 'ed25519'
  gem 'bcrypt_pbkdf'
end

group :test do
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
