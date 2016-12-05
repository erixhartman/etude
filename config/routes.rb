Rails.application.routes.draw do
  root 'home#index'
  resources :students, only: [:new, :create] do
    resources :lessons, only: [:index, :show]
  end

  resources :teachers, only: [:new, :create, :index, :show] do
    resources :lessons, only: [:index, :show]
  end

  resources :lessons, only: [:new, :create]
end
