Mellowgasm::Application.routes.draw do
  root :to => 'home#landing'
  resources :users, :only => [:index, :new, :create, :show]
  resources :friends

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  get '/home' => 'home#index'

  post '/new_map' => 'home#new_map'

  get 'venues/:id' => 'venues#ven_show'
end
