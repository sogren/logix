Rails.application.routes.draw do
  devise_for :users


  resources :users, only: [:show, :index]
  resources :topics, only: [:index, :show, :new, :create] do
    resources :answers, only: [:new, :create, :edit, :update]
  end
  resources :levels, only: [:show, :new, :create]

  root 'static_pages#home'

  get 'play' => 'static_pages#play', as: 'play'
  get 'editor' => 'static_pages#editor', as: 'editor'
  get 'about' => 'static_pages#about', as: 'about'
  get 'account' => 'users#account', as: 'account'
end
