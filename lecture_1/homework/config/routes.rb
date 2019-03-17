Rails.application.routes.draw do
  resources :clans do
  	resources :samurais, only: %i[index show create update destroy]
  end
end
