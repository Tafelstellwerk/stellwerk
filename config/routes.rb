Rails.application.routes.draw do
  resources :donations

  devise_for :users

  resources :users

  authenticated :user do
    root :to => "home#index", as: :user_root
  end

  get "styleguide" => "pages#styleguide"

  root to: "home#index_signed_out"
end
