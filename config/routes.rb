Rails.application.routes.draw do
  resources :stories
  root 'stories#index'
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:create, :destroy, :new]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
