Sportdb::Application.routes.draw do
  
  match 'about',    :to => 'pages#about'
  
  resources :countries
  resources :regions
 
  root :to => 'countries#index'

end
