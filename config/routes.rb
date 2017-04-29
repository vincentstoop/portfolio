Rails.application.routes.draw do
  devise_for :admin
  namespace :admin do
    resources :docs, only: [:index, :update]
    resources :pages
    resources :portfolio_items
  end

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
