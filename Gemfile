source 'https://rubygems.org'

gem 'rails', '3.2.12'

gem 'sinatra'

gem 'fetcher'   # used for fetching/downloading zip archives (datasets)

############
## lets use open world.db schema & fixtures

gem 'logutils', '0.6.0'

gem 'worlddb', '2.0.5'


#### fix/todo: add back in api service
## gem 'worlddb-service', '0.1.0'


gem 'worlddb-flags', '0.1.0'   # use bundled country flags


########
# add engines

gem 'worlddb-admin', '0.0.1', :path => './engine'


group :production do
  gem 'pg'
  gem 'thin'    # use faster multiplexed (w/ eventmachine) web server
end

group :development do
  gem 'sqlite3'
  gem 'annotate', '~> 2.4.1.beta'
end


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer'

  gem 'uglifier', '>= 1.0.3'
end


gem 'jquery-rails'
