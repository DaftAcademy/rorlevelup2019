Rails.application.routes.draw do
<<<<<<< HEAD

  get '/clans/:clan_id/samurais_alive', to: 'samurais#alive'
  get '/clans/:clan_id/samurais_death', to: 'samurais#dead'


  resources :clans, only: %i[index create] do
    resources :samurais, only: %i[index show create update destroy]
  end


=======
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
>>>>>>> 869f06f13ea441eb64c8e1c15f18c4cd4d70cc24
end
