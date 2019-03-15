Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/clans', to: 'clans#index'
  post '/clans', to: 'clans#create'
  get '/clans/:clan_id/samurais', to: 'samurais#index'
  post '/clans/:clan_id/samurais', to: 'samurais#create'
  put '/clans/:clan_id/samurais/:id', to: 'samurais#update'
  delete '/clans/:clan_id/samurais/:id', to: 'samurais#destroy'
  resources :clans do
    resources :samurais
  end
end
