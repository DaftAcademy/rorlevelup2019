Rails.application.routes.draw do
  # clans => warriors => weapons
  resources :clans, only: %i[index show create destroy update] do
    resources :warriors,only: %i[index show create destroy update] do
      resources :weapons, only: %i[index show create destroy update] 
    end
  end
  # warriors => weapons
  resources :warriors, only: %i[index show] do
    resources :weapons, only: %i[index show create destroy update]
  end
  # weapons
  resources :weapons, only: %i[index show]
  # fortresses
  resources :fortresses, only: %i[index show create destroy update] do
    resources :warriors, only: %i[index show]
  end
  # walls
  resources :walls, only: %i[index show create destroy update] do
    resources :warriors, only: %i[index show]
  end
  # gates
  resources :gates, only: %i[index show create destroy update] do
    resources :warriors, only: %i[index show]
  end
  # towers
  resources :towers, only: %i[index show create destroy update] do
    resources :warriors, only: %i[index show]
  end
end
