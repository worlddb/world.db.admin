
puts "[boot] routes.rb - before WorldDbAdmin::Engine.routes.draw"

WorldDbAdmin::Engine.routes.draw do

  puts "[boot] routes.rb - enter WorldDbAdmin::Engine.routes.draw"

  match 'about',    :to => 'pages#about'


  ###############################
  # routes for shortcuts (friendly urls)
  
  ## 2 lower case letters - assume shortcut for country
  match '/:key', :to => 'countries#shortcut', :as => :short_country_worker, :key => /[a-z]{2}/
  
  # 2 lower case letters / 2 lower case letters - assume shortcut for country/region
  match '/:country_key/:key', :to => 'regions#shortcut', :as => :short_region_worker, :country_key => /[a-z]{2}/, :key => /[a-z]{2}/

  match '/tag/:key', :to => 'tags#shortcut', :as => :short_tag_worker, :key => /[a-z][a-z0-9_]*/


  match 'territories', :to => 'countries#index_territories', :as => 'territories'


  resources :continents
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

  puts "[boot] routes.rb - leave WorldDbAdmin::Engine.routes.draw"

end

puts "[boot] routes.rb - after WorldDbAdmin::Engine.routes.draw"
