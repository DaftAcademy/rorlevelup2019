Rails.application.routes.draw do
  get   '/clans', to: 'clans#index'
  post  '/clans', to: 'clans#create'
end
