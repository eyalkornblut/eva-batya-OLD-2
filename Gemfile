source 'https://rubygems.org'

gem 'rails', '3.2.6'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'

group :development do

end
group :test do
	#preaty printed test output
	# gem 'turn', :required => false
end
group :development, :test do
	gem 'sqlite3'
end
group :production do
	gem "pg", "~> 0.14.0"
end

gem 'spree', '~> 1.1.2'
gem 'spree_i18n', :git => 'git://github.com/spree/spree_i18n.git'
# gem 'spree_heroku', '1.0.0', :git => 'git://github.com/paxer/spree-heroku.git'
gem 'aws-s3'