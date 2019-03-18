Rails.application.routes.draw do

  root 'clans#index'
  resources :clans, only: %i[index show create update destroy] do
    resources :samurais, only: %i[index show create update destroy] do
      get 'active', on: :collection
      get 'inactive', on: :collection
    end
  end
end
