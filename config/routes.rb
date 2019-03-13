Rails.application.routes.draw do
  devise_for :users
  root 'bank_account#index'

  resources :bank_accounts
end
