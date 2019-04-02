Rails.application.routes.draw do
  resources :clans, only: %i[index create] do
    resources :warriors
  end
end
