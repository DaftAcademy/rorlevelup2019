Rails.application.routes.draw do
  resources :clans do
    resources :samurais
  end
end
