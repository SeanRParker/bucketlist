Rails.application.routes.draw do
  get 'lists/index'

  get 'lists/edit'

  get 'lists/new'

  get 'lists/show'

  root 'static#index'
  devise_for :users

  resources :lists do
    resources :items
  end
end
