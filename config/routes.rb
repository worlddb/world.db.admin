Sportdb::Application.routes.draw do
  
  match 'about',    :to => 'pages#about'

  ###############################
  # routes for shortcuts (friendly urls)
  
  ## 2 lower case letters - assume shortcut for country
  match '/:key', :to => 'countries#shortcut', :as => :short_country_worker, :key => /[a-z]{2}/
  
  # 2 lower case letters / 2 lower case letters - assume shortcut for country/region
  match '/:country_key/:key', :to => 'regions#shortcut', :as => :short_region_worker, :country_key => /[a-z]{2}/, :key => /[a-z]{2}/
  
  match '/tag/:key', :to => 'tags#shortcut', :as => :short_tag_worker, :key => /[a-z][a-z0-9_]+/
  
    
  #############################    
  # routes for data export (comma separated values/csv or html table)  

  match '/countries/csv',      :to => 'export#csv_countries',        :as => :csv_countries
  match '/tag/:key/csv',       :to => 'export#csv_countries_by_tag', :as => :csv_countries_by_tag_worker, :key => /[a-z][a-z0-9_]+/
  match '/cities/csv',         :to => 'export#csv_cities',           :as => :csv_cities

     
  resources :countries
  resources :regions
  resources :tags
  resources :cities


  ###############################
  # more routes for shortcuts (friendly urls)
 
  # 3 and more lower case letters - assume shortcut for city
  # nb: goes last; do NOT want to catch controller names such as cities,countries,etc.
  match '/:key', :to => 'cities#shortcut', :as => :short_city_worker, :key => /[a-z]{3,}/
  
  root :to => 'countries#index'

end
