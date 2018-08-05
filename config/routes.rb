Rails.application.routes.draw do


  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'profile/list'
  get 'profile/allusers'

  devise_for :users
  # controllers: {
  #     registrations: 'users/registrations'
  #   }

  resources :nokta do
    resources :comments
    member do
        put "like", to: "nokta#upvote"
        put "dislike", to: "nokta#downvote"
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'nokta#index'
end
