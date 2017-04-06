Rails.application.routes.draw do

  namespace :admin do
    resources :pages
    resources :photos, only: [:destroy]
  end

  devise_for :admin

  root to: "pages#index"
end
