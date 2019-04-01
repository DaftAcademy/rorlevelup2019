Rails.application.routes.draw do

  resources :castles, only: %i[index show create] do
    resources :warriors, module: :clans do
      resources :weapons, only: %i[create]
    end
  end

  resources :barricades, only: %i[index show create] do
    resources :warriors, module: :clans do
      resources :weapons, only: %i[create]
    end
  end

  resources :strongholds, only: %i[index show create] do
    resources :warriors, module: :clans do
      resources :weapons, only: %i[create]
    end
  end

  resources :towers, only: %i[index show create] do
    resources :warriors, module: :clans do
      resources :weapons, only: %i[create]
    end
  end

  resources :walls, only: %i[index show create] do
    resources :warriors, module: :clans  do
      resources :weapons, only: %i[create]
    end
  end

  resources :clans, only: %i[index create] do
    resources :warriors, module: :clans do
      resources :weapons, only: %i[create]
    end
  end

  resources :weapons, module: :clans, only: %i[index]

end
