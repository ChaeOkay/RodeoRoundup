Rails.application.routes.draw do

  resources :members, only: [:show]
  resources :organizations, only: [:show]
end
