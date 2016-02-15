Rails.application.routes.draw do
  devise_for :users


  resources :users, only: [:show, :index]
  resources :topics, only: [:index, :show, :new, :create] do
    resources :answers, only: [:new, :create, :edit, :update]
  end
  resources :levels, only: [:show, :new, :create]

  root 'static_pages#home'

  get 'about' => 'static_pages#about', as: 'about'

  get 'play' => 'levels#play', as: 'play'
  get 'editor' => 'levels#editor', as: 'editor'

  get 'account' => 'users#account', as: 'account'
end
