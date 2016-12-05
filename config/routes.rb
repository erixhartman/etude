Rails.application.routes.draw do
  root :to => redirect('/teachers')
  resources :students, only: [:new, :create] do
    resources :lessons, only: [:index, :show]
  end

  resources :teachers, only: [:new, :create, :index, :show] do
    resources :lessons, only: [:index, :show]
  end

  resources :users, only: [:new, :create]

  resources :lessons, only: [:new, :create]

  resources :sessions, only: [:new, :create, :destroy]
end
