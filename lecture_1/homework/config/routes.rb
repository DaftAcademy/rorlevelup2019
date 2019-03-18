Rails.application.routes.draw do
  get '/clans/:clan_id/samurais_alive', to: 'samurais#alive'
  get '/clans/:clan_id/samurais_dead', to: 'samurais#dead'
  resources :clans do
    resources :samurais
  end
end
