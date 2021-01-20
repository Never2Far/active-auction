Rails.application.routes.draw do
  resources :questions
  root to: 'welcome#home'
  get '/search' => 'application#search'
  devise_for :users, controllers: {sessions: 'users/sessions', omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations'}


  devise_scope :user do
    get 'sign_out' => 'devise/sessions#destroy'
    get 'users/sign_out' => 'devise/sessions#destroy'
    get 'sign_in' => 'devise/sessions#new'
    delete 'sign_out', :to => 'devise/sessions#destroy'
    get 'dashboard' => 'users#dashboard'
  end

  resources :users, only: [:show, :edit, :update]
  # resources :organizations
  resources :items
  resources :bids
  resources :questions
  get 'listings/active' => 'listings#index_active'
  resources :auctions do
resources :listings, only: [:new, :create, :index, :show]
  end
  resources :listings, shallow: true do
    resources :bids
    resources :items
    resources :questions

  end

  resources :auctions
end
