Rails.application.routes.draw do
  resources :clans, only: [:create, :index]
end
