Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: 'pages#home'


  resources :users, only: [:show] do
    resources :toilets, only: [:new, :create]
    resources :bookings, only: [:show, :destroy]
  end

  resources :toilets, only: [:index, :show, :destroy, :edit, :update] do
    resources :bookings, only: [:new, :create]
    get 'events', on: :member
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
