Rails.application.routes.draw do
  devise_for :users
   root to: 'pages#home'
   resources :authors, only: [:new, :index, :show, :create, :delete]
   resources :books, only: [:new, :create, :delete, :show]


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
