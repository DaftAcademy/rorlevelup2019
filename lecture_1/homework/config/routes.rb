# frozen_string_literal: true

Rails.application.routes.draw do
  get 'samurais/index'
  get 'clans/index'
  resources :clans, param: :name do
    resources :samurais do
      resources :alive, only: %i[index]
      resources :dead, only: %i[index]
    end
  end
end
