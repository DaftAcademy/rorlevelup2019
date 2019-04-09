# frozen_string_literal: true

Rails.application.routes.draw do
  resources :clans, only: %i[index create show] do
    resources :warriors, module: :clans
  end

  resources :mercenaries, only: %i[index show] do
    collection do
      post 'employ_best'
    end

    collection do
      post 'employ_best_better'
    end

    member do
      post 'employ'
    end

    member do
      post 'employ_better'
    end
  end
end
