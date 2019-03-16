Rails.application.routes.draw do
  scope "/api" do
    resources :clans do
        resources :samurais
    end
  end
end