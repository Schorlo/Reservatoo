Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :restaurants, only: [:index, :show] do
    resources   :reservations, only: [:index, :new, :create, :destroy]
    resources :reviews, only: [:index, :show, :new, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
