Rails.application.routes.draw do
  devise_for :users
  root to: 'creators#index'
  resources :creators, only: %i[index new create]
end
