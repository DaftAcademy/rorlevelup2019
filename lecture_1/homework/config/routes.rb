Rails.application.routes.draw do

  resources :clans, only: [:index, :create] do
    get 'dead', to: 'clans#dead'
    resources :samurais 
  end

end
