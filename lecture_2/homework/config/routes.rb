Rails.application.routes.draw do
  resources :clans, only: %i[index create] do
    scope module: :clans do
      resources :warriors
    end
  end
end
