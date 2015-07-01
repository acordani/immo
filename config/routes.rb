Rails.application.routes.draw do


  ActiveAdmin.routes(self)
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  resources :announces
  # resources :wicked, only: [:create, :show, :update]
  resources :searches


end
