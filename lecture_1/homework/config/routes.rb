Rails.application.routes.draw do
  resources :clans, only: %i[index create] do
    resources :samurais
  end
end
