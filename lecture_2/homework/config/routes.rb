# frozen_string_literal: true

Rails.application.routes.draw do
  get 'clans/index'
  get 'characters/index'
  get '/clans/:clan_id/alive', to: 'characters#alive'
  get '/clans/:clan_id/dead', to: 'characters#dead'
  resources :clans, only: %i[index create show update destroy] do
    resources :characters, module: :clans
  end
end
