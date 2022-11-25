Rails.application.routes.draw do
  devise_for :users
  root to: 'creators#index'
  resources :creators, only: [:index, :new, :create, :show] do
    resources :records, only: [:new, :create]
  end
  resources :users, only: :show
end
