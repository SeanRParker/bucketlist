Rails.application.routes.draw do
root 'static#index'
  devise_for :users, controllers: {
        registrations: 'users/registrations'

  resources :lists do
    resources :items
  end
end
