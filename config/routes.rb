Rails.application.routes.draw do

  resources :members, only: [:index, :show]
  resources :organizations, only: [:index, :show]
end
