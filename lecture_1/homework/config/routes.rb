Rails.application.routes.draw do

  get '/clans/clan_id/samurais_alive', to: 'samurais#alive'
  get '/clans/clan_id/samurais_death', to: 'samurais#dead'


  resources :clans, only: %i[index create] do
    resources :samurais, only: %i[index show create update destroy]
  end


end
