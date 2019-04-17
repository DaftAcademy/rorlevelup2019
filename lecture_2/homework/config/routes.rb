# frozen_string_literal: true

Rails.application.routes.draw do
  get 'clans/index'
  get 'characters/index'
  resources :clans, only: %i[index create show update destroy] do
    resources :characters, module: :clans
  end
end
