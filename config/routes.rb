Rails.application.routes.draw do
  root "home#top"
  get 'home/top'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  get 'users/show'
  resources :users, only: [:show]

  resources :events
    root 'events#index'
  end


devise_scope :user do
  get '/users/sign_out' => 'devise/sessions#destroy'
end


