Rails.application.routes.draw do
  resources :clans, only: %i[index create] do
<<<<<<< HEAD
    resources :samurais
=======
    resources :samurais, module: :clans
>>>>>>> 869f06f13ea441eb64c8e1c15f18c4cd4d70cc24
  end
end
