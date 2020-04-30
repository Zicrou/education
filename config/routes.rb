Rails.application.routes.draw do
  resources :type_exercices
  resources :matieres
  resources :series
  resources :niveaus
  resources :exercices
  resources :lecons
  resources :topics, only: [:index, :show]
  #get 'topics/index'
  #get 'topics/show'
  #resources :comments
  devise_for :users, path: '', path_names: {sign_in: 'Login', sign_out: 'Logout', sign_up: 'Register'}
  resources :portfolios, except: [:show] do
    put :sort, on: :collection
  end
  get 'angular-items', to: 'portfolios#angular'
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
  
  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  resources :blogs do
    member do
      get :toggle_status
    end
  end
  resources :topics
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  mount ActionCable.server => '/cable'

  root to: 'pages#home'
end
