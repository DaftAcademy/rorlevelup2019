Rails.application.routes.draw do
  get '/samurais', to: 'samurais#index'
  put '/samurais/:id', to: 'samurais#update'
  resources :clans do
    resources :samurais, only: %i[index create update destroy]
  end
end
