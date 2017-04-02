Rails.application.routes.draw do
  namespace :admin do
    resources :pages
  end

  devise_for :admin
  get 'pages/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "pages#index"
end
