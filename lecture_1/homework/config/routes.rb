Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :clans do
    resources :samurais, only: %i[index create update destroy]
  end
end
