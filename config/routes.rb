Rails.application.routes.draw do
  devise_for :users
  root to: 'creators#index'
  resources :creators do
    resources :records, only: [:new, :create, :show, :edit, :update, :destroy]
  end
  resources :users, only: :show
end
