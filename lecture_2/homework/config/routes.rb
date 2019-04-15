Rails.application.routes.draw do
  resources :clans, only: %i[index show create update] do
    resources :warriors, module: :clans do
      resources :weapons, only: %i[index show create update]
    end
  end
end
