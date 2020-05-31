Rails.application.routes.draw do
  devise_for :users
   root to: 'pages#home'
   resources :authors, only: [:new, :index, :show, :create, :delete] do
    resources :books, only: [:new, :create, :delete, :show]

   end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
