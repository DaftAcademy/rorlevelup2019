Rails.application.routes.draw do
  resources :clans, only: %i[index create] do
    resources :samurais, only: %i[index create update destroy]
  end
end
