Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  resources :group_expenses
  resources :groups
  resources :expenses
  resources :users
  get "splash_screen", to: "home#splash_screen"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
