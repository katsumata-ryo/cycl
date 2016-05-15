Rails.application.routes.draw do

  authenticated :user do
    root :to => "summary#index", :as => "user_authenticated_root"
  end
  root to: "home#index"

  resources :records
  get 'records/:year/:month', to: 'records/months#show'

  resources :configs, only: ['index']
  resources :categories, only: ['new', 'edit', 'update', 'create', 'destroy']

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  get 'home/index'
  get 'home/show'
  get 'summary', to: 'summary#index'
  get 'summary/:year/:month', to: 'summary/months#show'
end
