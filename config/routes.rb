Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items do
<<<<<<< Updated upstream
    resources :orders, only: [:index, :create]
=======
    resources :orders, only:[:index, :create]
>>>>>>> Stashed changes
  end
end
