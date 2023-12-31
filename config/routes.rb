Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "events#index"

  resources :events

  resources :users, only: %i[index]

  resources :attendances, only: %i[destroy] do
    post :join
  end
end
