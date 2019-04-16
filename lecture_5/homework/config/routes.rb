# frozen_string_literal: true

Rails.application.routes.draw do
  resources :clans, only: %i[index create show] do
    resources :warriors, module: :clans
  end

  resources :buildings, only: %i[index show]
end
