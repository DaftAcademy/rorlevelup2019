Rails.application.routes.draw do
  resources :clans,  only: %i[index create show] do
    resources :warriors, only: %i[index create show update destroy] do
      resources :weapons, only: %i[index create show update destroy]
    end
  end
  resources :towers, only: %i[index create show]
  resources :trees, only: %i[index create show]
  resources :strongholds, only: %i[index create show]
end