Rails.application.routes.draw do
  resources :items
  resources :listings
  resources :auctions
  root to: 'welcome#home'

  devise_scope :user do
    get 'users/sign_out' => 'devise/sessions#destroy'
    delete 'sign_out', :to => 'devise/sessions#destroy'#, :as => :destroy_user_session
  end
  
  devise_for :users, controllers: {sessions: 'users/sessions', omniauth_callbacks: 'users/omniauth_callbacks'}
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
