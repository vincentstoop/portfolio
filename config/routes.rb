Rails.application.routes.draw do
  namespace :admin do
    resources :pages
  end

  devise_for :admin

  root to: "pages#index"
end
