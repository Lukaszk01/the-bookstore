Rails.application.routes.draw do
  devise_for :users
   root to: 'pages#home'
   resources :authors, only: [:new, :index, :show, :create, :delete] do
    resources :books, only: [:create]
    resources :dashboard, only: [:index]
  end
  resources :books, only: [:destroy]
end
