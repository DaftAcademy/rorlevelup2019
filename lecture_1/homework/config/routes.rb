Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :clans, only: [:index, :new, :create] do
    resources :samurais do
      collection do
        get 'dead'
        get 'alive'
      end
    end
  end
end
