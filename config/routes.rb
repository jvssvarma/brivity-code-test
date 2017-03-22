Rails.application.routes.draw do
  resources :comments
  resources :posts
  devise_for :users, controllers: { registrations: 'registrations' }
  root 'posts#index'
end
