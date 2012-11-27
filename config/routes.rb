Sportdb::Application.routes.draw do
  
  match 'about',    :to => 'pages#about'
  
  # 2 lower case letters - assume shortcut for country
  match '/:key', :to => 'countries#shortcut', :as => :short_country, :key => /[a-z]{2}/
  
  # 2 lower case letters / 2 lower case letters - assume shortcut for country/region
  match '/:country_key/:key', :to => 'regions#shortcut', :as => :short_region, :country_key => /[a-z]{2}/, :key => /[a-z]{2}/
  
  match '/tag/:key', :to => 'tags#shortcut', :as => :short_tag, :key => /[a-z][a-z0-9_]+/
  
  resources :countries
  resources :regions
  resources :tags
  resources :cities
 
  # 3 and more lower case letters - assume shortcut for city
  # nb: goes last; do NOT want to catch controller names such as cities,countries,etc.
  match '/:key', :to => 'cities#shortcut', :as => :short_city, :key => /[a-z]{3,}/
  
  root :to => 'countries#index'

end
