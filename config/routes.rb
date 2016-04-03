Rails.application.routes.draw do

  resources :wishlists, except: [:edit, :update]
  resources :donations
  resources :tafel, except: [:new, :show]

  resources :donation_cases, except: :create
  get 'donation_cases/:id/close', to: 'donation_cases#close', as: :close_donation_case

  resources :donation_deliveries, except: [:create, :show]
  get 'donation_delivery/:id/reopen', to: 'donation_deliveries#reopen', as: :reopen_donation_delivery
  get 'donation_delivery/:id/download_xls', to: 'donation_deliveries#download_xls', as: :download_xls_donation_delivery

  devise_for :users

  resources :users

  authenticated :user do
    root :to => "donation_cases#index", as: :user_root
  end

  root to: "home#index_signed_out"
end
