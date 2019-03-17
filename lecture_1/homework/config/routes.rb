Rails.application.routes.draw do
  resources :clans,  only: %i[index create show] do
    resources :samurais, only: %i[index create show update destroy]
  end
end
