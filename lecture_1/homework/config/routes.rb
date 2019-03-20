Rails.application.routes.draw do
  get 'samurais/index'
  get 'clans/index'
  get '/clans/:clan_id/alive', to: 'samurais#alive'
  get '/clans/:clan_id/dead', to: 'samurais#dead'
  resources :clans do
    resources :samurais
  end
end

