Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index]
  resources :categories, only: [:index, :new, :create] do
    resources :expenditures, only: [:index, :new, :create]
  end
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")  
  root "home#index"

end
