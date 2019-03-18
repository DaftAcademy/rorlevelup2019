Rails.application.routes.draw do
  scope "/api" do
    resources :clans do
      resources :samurais, only: %i[index create update destroy show]
    end
  end
end
