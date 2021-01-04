Rails.application.routes.draw do
  root to: 'welcome#home'
  devise_for :admins, controllers: { omniauth_callbacks: 'admins/omniauth_callbacks' }
  devise_scope :admin do
    get 'admins/sign_in', to: 'admins/sessions#new', as: :new_admin_session
    get 'admins/sign_out', to: 'admins/sessions#destroy', as: :destroy_admin_session
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/dashboard', to: 'dashboards#index'

  get '/workouts', to: 'workouts#index'
  get '/community', to: 'community#index'
  get '/advice', to: 'advice#index'

  resources :workouts do
    resources :exercises do
      resources :setlists
    end
  end
  resources :users, only: [:new, :create, :edit, :update]
end
