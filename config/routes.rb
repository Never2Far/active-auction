Rails.application.routes.draw do
  root to: 'welcome#home'
  get '/search' => 'application#search'
  resources :users
  devise_scope :user do
    get 'users/sign_up' => 'devise/registrations#new'
    get 'sign_up' => 'devise/registrations#new'
    get 'sign_out' => 'devise/sessions#destroy'
    get 'users/sign_out' => 'devise/sessions#destroy'
    get 'sign_in' => 'devise/sessions#new'
    delete 'sign_out', :to => 'devise/sessions#destroy'#, :as => :destroy_user_session
    get 'users/:id' => 'users#show'
    get 'dashboard' => 'users#dashboard'
  end
  
  devise_for :users, controllers: {sessions: 'users/sessions', omniauth_callbacks: 'users/omniauth_callbacks'}
  
  resources :organizations
  resources :items
  resources :bids

  resources :listings, shallow: true do
    resources :bids
    resources :items
  end

  resources :auctions
  
  

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
