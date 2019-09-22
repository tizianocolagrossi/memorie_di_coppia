Rails.application.routes.draw do

  get 'signup' => 'users#new'
  get 'login' => 'session#new'
  post 'login' => 'session#create'
  delete 'logout' => 'session#destroy'
  get 'logout' => "session#destroy"
  root :to => 'pages#home'
  #get 'image/:id' => 'micropost#show'  
  resources :users

  resources :microposts, only: [:create, :destroy, :new, :show]

end
