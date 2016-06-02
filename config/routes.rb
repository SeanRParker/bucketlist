Rails.application.routes.draw do
root 'static#index'
  devise_for :users

  resources :lists do
    resources :items
  end
end
