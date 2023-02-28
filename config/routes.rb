Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "menu#index"

  resources :menu, only: [:index]
  resources :orders, only: [:create, :new, :index]
end
