Rails.application.routes.draw do
  get 'comments/create'
  root "home#top"

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  resources :users, only: [:show]

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
  resources :events do
    resources :pictures do
      resources :comments
    end
  end
end







