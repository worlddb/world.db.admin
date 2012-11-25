Sportdb::Application.routes.draw do
  
  match 'about',    :to => 'pages#about'
  
  resources :countries
  resources :regions
  resources :tags
 
  root :to => 'countries#index'

end
