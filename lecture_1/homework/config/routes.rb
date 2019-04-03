# frozen_string_literal: true

Rails.application.routes.draw do
  resources :clans, only: %i[index create] do
    resources :warriors, only: %i[index create update destroy]
  end
  resources :barricades, only: %i[index create]
end
