Rails.application.routes.draw do
  resources :posts do
    resources :comments, except: [:index, :new, :show, :edit]
  end
  devise_for :users, controllers: { registrations: 'registrations' }
  root 'posts#index'

  get '*path' => redirect('/')
end
