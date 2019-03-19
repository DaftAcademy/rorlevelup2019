Rails.application.routes.draw do
  resources :clans, only: [:create, :index] do
    resources :samurais
  end
end
