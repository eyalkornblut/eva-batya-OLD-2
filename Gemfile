source 'https://rubygems.org'

gem 'rails', '3.2.8'

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
	gem 'pry'
	gem 'pry-doc'
	gem 'pry-rails'
	gem 'pry-nav'
	gem 'pry-stack_explorer'
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

gem 'aws-s3'

gem 'spree', '~> 1.2.0'
gem "spree_auth_devise", :git => "git://github.com/spree/spree_auth_devise", :branch => '1-2-stable'
gem 'spree_i18n', :git => 'git://github.com/spree/spree_i18n.git'
# gem 'spree_heroku', '1.0.0', :git => 'git://github.com/paxer/spree-heroku.git'
gem 'spree_essentials', :git => 'git://github.com/pythonheads/spree_essentials.git'
gem 'spree_essential_cms'
gem 'spree_comments', :git => 'git://github.com/spree/spree_comments.git', :branch => 'master'
gem 'spree_contact_us', '~> 1.1.0'
gem 'spree_clean', :git => "git://github.com/spree/spree_clean.git"
gem 'spree_related_products', :git => 'git://github.com/spree/spree_related_products.git'
gem 'spree_slider'
gem 'spree_last_address', :git => "git://github.com/dancinglightning/spree-last-address.git"