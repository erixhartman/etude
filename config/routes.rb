Rails.application.routes.draw do
  root :to => redirect('/teachers')
  resources :students, only: [:new, :create]

  resources :teachers, only: [:new, :create, :index, :show] do
    resources :lessons, only: [:new, :create]
  end

  resources :users, only: [:new, :create, :show]

  resources :sessions, only: [:new, :create, :destroy]
end
