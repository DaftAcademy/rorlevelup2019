# frozen_string_literal: true

Rails.application.routes.draw do
  resources :clans, only: %i[index create show] do
    resources :warriors, module: :clans
  end

  resources :mercenaries, only: %i[index show create]
  post '/mercenaries/:id', to: 'mercenaries#create'
end
