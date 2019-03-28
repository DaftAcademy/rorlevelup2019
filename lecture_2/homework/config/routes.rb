Rails.application.routes.draw do
  resources :clans, only: %i[index create] do
    scope module: :clans do
      resources :samurais
    end
  end
end
