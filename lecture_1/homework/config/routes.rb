# frozen_string_literal: true

Rails.application.routes.draw do
  get 'samurais/index'
  get 'clans/index'
  resources :clans, only: %i[index create show update destroy] do 
    resources :samurais, module: :clans do
      resources :alive, only: %i[index]
      resources :dead, only: %i[index]
    end
  end
end