Rails.application.routes.draw do
  root to: 'welcome#home'
  get '/search' => 'application#search'
  devise_for :users, controllers: {sessions: 'users/sessions', omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations'}


  devise_scope :user do
    #get 'users/sign_up' => 'devise/registrations#new', :as => :registration
    #get 'sign_up' => 'devise/registrations#new'
    #post 'users' => 'devise/registrations#create'
    get 'sign_out' => 'devise/sessions#destroy'
    get 'users/sign_out' => 'devise/sessions#destroy'
    get 'sign_in' => 'devise/sessions#new'
    delete 'sign_out', :to => 'devise/sessions#destroy'#, :as => :destroy_user_session
    #get 'users/:id' => 'users#show'
    get 'dashboard' => 'users#dashboard'
  end

  resources :users, only: [:show, :edit, :update]
  # get 'users/sign_up' => 'devise/registrations#new'
  # get 'sign_up' => 'devise/registrations#new'

  #post 'dashboard' => 'welcome#add_username'
  
  
  # resources :organizations
  resources :items
  resources :bids

  resources :listings, shallow: true do
    resources :bids
    resources :items
  end

  delete 'listings/:id' => 'listings#destroy'

  resources :auctions
end
