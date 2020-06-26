Rails.application.routes.draw do
  devise_for :users
   root to: 'pages#home'
   resources :authors, only: [:new, :index, :show, :create, :delete, :edit] do
    resources :books, only: [:new, :create, :delete, :show]
    resources :dashboard, only: [:index]
  end
end
