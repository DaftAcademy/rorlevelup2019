Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :clans, only: [:create, :index] do
    resources :warriors
  end
end