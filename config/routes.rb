Rails.application.routes.draw do

  get 'signup' => 'users#new'
  get 'login' => 'session#new'
  post 'login' => 'session#create'
  delete 'logout' => 'session#destroy'
  get 'logout' => "session#destroy"
  root :to => 'pages#home'
  resources :users

  #post 'users' => 'users#create'
  #get 'users/new' => 'users#new'
  #get 'users/:id/edit' => 'users#edit'
  #get 'users/:id' => 'users#show' 
  #patch 'users/:id' => 'users#update' 
  #put 'users/:id' => 'users#update' 
  #delete 'users/:id' => 'users#destroy' 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
