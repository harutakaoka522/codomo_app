Rails.application.routes.draw do
  # get 'pictures/index'
  # get 'pictures/new'
  # get 'pictures/show'
  # get 'pictures/edit'
  root "home#top"
  # get 'home/top'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  #get 'users/show'
  resources :users, only: [:show]

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
  resources :events do
    resources :pictures
    #  collection do
    #  end
  end

   # root 'events#index'
end





