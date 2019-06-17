Rails.application.routes.draw do
  root "home#top"
  get 'home/top'
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end


  devise_for :users, controllers: {
        registrations: 'users/registrations',
        sessions: 'users/sessions'
}



resources :users, only: [:show]
get 'users/show'

devise_scope :user do
  get '/users/sign_out' => 'devise/sessions#destroy'
end

resources :events
  root 'events#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
