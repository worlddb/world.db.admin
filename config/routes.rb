Sportdb::Application.routes.draw do
  
  match 'about',    :to => 'pages#about'

  ###
  # mount sinatra app (bundled w/ worlddb-service gem) for json api service

  # todo: add  JSON API link to layout

  match '/api' => redirect('/api/v1')
  mount WorldDB::Service::Server, :at => '/api/v1'  # NB: make sure to require 'worlddb-service'

  ## mount sinatra app (bundled w/ logutils gem)
  mount LogDb::Server, :at => '/logs'    # NB: make sure to require 'logutils/server'



  ###############################
  # routes for shortcuts (friendly urls)
  
  ## 2 lower case letters - assume shortcut for country
  match '/:key', :to => 'countries#shortcut', :as => :short_country_worker, :key => /[a-z]{2}/
  
  # 2 lower case letters / 2 lower case letters - assume shortcut for country/region
  match '/:country_key/:key', :to => 'regions#shortcut', :as => :short_region_worker, :country_key => /[a-z]{2}/, :key => /[a-z]{2}/

  match '/tag/:key', :to => 'tags#shortcut', :as => :short_tag_worker, :key => /[a-z][a-z0-9_]*/


  resources :countries
  resources :regions
  resources :tags
  resources :cities
  resources :codes
  resources :langs


  ###############################
  # more routes for shortcuts (friendly urls)
 
  # 3 and more lower case letters - assume shortcut for city
  # nb: goes last; do NOT want to catch controller names such as cities,countries,etc.
  match '/:key', :to => 'cities#shortcut', :as => :short_city_worker, :key => /[a-z]{3,}/
  
  root :to => 'countries#index'

end
