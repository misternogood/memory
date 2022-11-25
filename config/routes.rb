Rails.application.routes.draw do
  devise_for :users
  root to: "creators#index"
  resources :creators, only: [:index, :new, :create]
end
