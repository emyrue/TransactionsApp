Rails.application.routes.draw do
  devise_for :users
  resources :group_expenses
  resources :groups
  resources :expenses
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
