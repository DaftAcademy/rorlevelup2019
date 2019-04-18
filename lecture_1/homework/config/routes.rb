# frozen_string_literal: true

Rails.application.routes.draw do
  resources :clans, only: %i[index show create] do
    resources :warriors, only: %i[index show create update destroy] do
      resources :weapons, only: %i[index show create update]
    end
  end
  resources :buildings, only: %i[index show] do
    member do
      get 'siege_report'
    end
  end
end
