Rails.application.routes.draw do
  root "home#top"
  get '/about', to: "home#about", as: "about"
  devise_for :users, controllers:{
    sessions: "users/sessions",
    passwords: "users/passwords",
    registrations: "users/registrations"
  }
  resources :users, only:[:index, :show, :edit, :update, :destroy] do
    resources :likes, only:[:index, :create, :destroy]
  end
  resources :posts do
    resources :comments, only:[:create, :update, :destroy]
  end
  resources :rooms, only:[:show, :create] do
    post 'messages/create'
    delete 'messeges/destroy'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
