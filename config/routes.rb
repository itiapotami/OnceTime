Rails.application.routes.draw do
  devise_for :owners, controllers: {
    sessions:      'owners/sessions',
    passwords:     'owners/passwords',
    registrations: 'owners/registrations'
  }
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  
  root to: 'user_hotels#index'
  resources :users, only: [:show, :edit, :update]
  resources :user_hotels, only: [:index, :show]
  resources :hotels, only: [:index, :new, :create, :show, :edit, :update] do
    resources :rooms, only: [:new, :create]
  end
  resources :reservations, only: [:new, :create]
  resources :chat_rooms, only: [:show, :create] do
    resources :chat_messages, only: [:create]
  end
end
