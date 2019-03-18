Rails.application.routes.draw do

  # Czy powinniśmy odrazu wersjonować api? tj. namespace :api do namespace :v1 do czy moze jako scope?
  resources :clans, only: [:index, :create] do
    get 'dead', to: 'clans#dead' # Wydaje mi się to nieco wygodniejsze od parametru w indexie, ale zaimplementowałem oba rozwiązania
    resources :samurais 
  end

end
