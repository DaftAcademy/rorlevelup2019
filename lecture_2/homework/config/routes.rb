Rails.application.routes.draw do
  resources :clans, only: %i[index create] do
    resources :samurais, module: :clans
  end
end
