Rails.application.routes.draw do
  get 'clans/:clan_id/samurais/dead', to: 'samurais#dead'
  get 'clans/:clan_id/samurais/alive', to: 'samurais#alive'
  resources :clans do
    resources :samurais    
  end
end
