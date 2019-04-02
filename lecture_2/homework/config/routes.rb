Rails.application.routes.draw do

  resources :clans, only: %i[index create destroy] do
    resources :warriors, module: :clans
  end

  resources :weapons, only: %i[index create destroy update]

end
