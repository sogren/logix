Rails.application.routes.draw do
  devise_for :users


  resources :users, only: [:new, :create]

  root 'static_pages#home'

  get 'play' => 'static_pages#play', as: 'play'
  get 'about' => 'static_pages#about', as: 'about'
end
