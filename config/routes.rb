Rails.application.routes.draw do
  root to: 'welcome#home'

  devise_scope :user do
    get 'sign_out' => 'devise/sessions#destroy'
    get 'users/sign_out' => 'devise/sessions#destroy'
    get 'sign_in' => 'devise/sessions#new'
    delete 'sign_out', :to => 'devise/sessions#destroy'#, :as => :destroy_user_session
    get 'users/:id' => 'users#show'
  end
  
  devise_for :users, controllers: {sessions: 'users/sessions', omniauth_callbacks: 'users/omniauth_callbacks'}
  
  resources :organizations
  resources :items
  resources :listings
  resources :auctions
  resources :bids
  

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
