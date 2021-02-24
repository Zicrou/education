Rails.application.routes.draw do
  resources :responszones do
    collection do
      get :filtered
    end
    collection do
      get :responszone_user_id
    end
  end
  resources :centres
  resources :juris
  resources :students
  resources :metiers
  resources :domaines
  resources :ouvriers do
    collection do
      get :recherche
    end
    collection do
      get :filtered
    end
  end
  resources :users do
    member do
      get :definir_profil
    end
  end
  resources :profils
  resources :authors
  resources :matieres
  resources :seris
  resources :niveaus
  resources :etablissements
  resources :departements
  resources :regions
  resources :countries
  resources :type_exercices
  resources :exercices
  resources :lecons
  resources :topics, only: [:index, :show]
  get '/check.txt', to: proc {[200, {}, ['HUWAL_FATHUL_ALIIMUL_GREIY']]}
  #get 'topics/index'
  #get 'topics/show'
  #resources :comments
  devise_for :users, path: '', path_names: {sign_in: 'Login', sign_out: 'Logout', sign_up: 'Register'}, controllers:{sessions: 'users/sessions'}
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

  #mount ActionCable.server => '/cable'

  root to: 'blogs#index'
end
