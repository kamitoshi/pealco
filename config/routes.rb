Rails.application.routes.draw do
  root "home#top"
  get '/about', to: "home#about", as: "about"

  mount ActionCable.server => "/cable"

  devise_for :users, controllers:{
    sessions: "users/sessions",
    passwords: "users/passwords",
    registrations: "users/registrations"
  }
  resources :users, only:[:index, :show, :edit, :update, :destroy] do
    member do
      get "follow"
      get "follower"
    end
    resources :likes, only:[:index]
    resources :rooms, only:[:create]
  end
  resources :rooms, only:[:show] do
    resources :messages, only:[:create, :destroy]
  end
  resources :follows, only:[:create, :destroy]
  resources :posts do
    resources :comments, only:[:create, :update, :destroy]
    resources :likes, only:[:create, :destroy]
    resources :reviews
  end
  resources :schedules
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
