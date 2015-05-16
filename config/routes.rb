Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root :to => "home#index", as: :user_root
  end

  root to: "home#index_signed_out"
end
