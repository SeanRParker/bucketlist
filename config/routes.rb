Rails.application.routes.draw do
  root 'static#index'
  devise_for :users
  
end
