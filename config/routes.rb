Rails.application.routes.draw do
  resources :donations
  resources :donation_cases

  devise_for :users

  resources :users

  authenticated :user do
    root :to => "home#index", as: :user_root
  end

  root to: "home#index_signed_out"
end
