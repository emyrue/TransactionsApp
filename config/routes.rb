Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  resources :groups, only: [:index, :new, :create] do
    resources :expenses, only: [:index, :new, :create]
  end
  resources :expenses
  get "splash_screen", to: "home#splash_screen"
  root to: "groups#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
