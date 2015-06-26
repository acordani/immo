Rails.application.routes.draw do


  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  resources :announces
  # resources :wicked, only: [:create, :show, :update]


end
