Rails.application.routes.draw do
  devise_for :users
   root to: 'pages#home'
    resources :books, only: [:index, :search] do
      resources :authors, only: [:new, :index, :show, :create, :delete]
   end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
