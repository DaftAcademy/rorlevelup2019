Rails.application.routes.draw do

  root 'clans#index'
  resources :clans, only: %i[index show create update destroy] do
    resources :samurais, only: %i[index show create update destroy]
  end
end
