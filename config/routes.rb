Rails.application.routes.draw do

  root :to => redirect('/teachers')

  resources :subjects, only: [:index, :show]

  resources :students, only: [:new, :create, :edit, :update]

  resources :teachers, only: [:new, :create, :edit, :update, :index, :show] do
    resources :lessons, only: [:new, :create]
  end

  resources :lessons, only: [:show, :destroy]

  resources :users, only: [:new, :create, :show]

  resources :sessions, only: [:new, :create, :destroy]

  resources :availability_ranges, only: [:new, :create, :show, :edit, :update, :destroy]



end
