Rails.application.routes.draw do
    get 'clans/:clan_name/samurais/alive', to: 'samurais#alive'
    get 'clans/:clan_name/samurais/kaput', to: 'samurais#kaput'
    resources :clans, param: :name  do
      resources :samurais
    end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
