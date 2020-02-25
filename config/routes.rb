Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'


  resources :users, only: [:show] do
    resources :toilets, only: [:new, :create, :edit, :update, :destroy]
    resources :bookings, only: [:show, :destroy]
  end

  resources :toilets, only: [:index, :show] do
    resources :bookins, only: [:new, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
