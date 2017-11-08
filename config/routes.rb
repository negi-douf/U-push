Rails.application.routes.draw do

  devise_for :users, controllers: {
    omniauth_callbacks: "omniauth_callbacks"
  }

  resources :pages, only: [ :index, :create, :destroy ]

  root "pages#index"
end
