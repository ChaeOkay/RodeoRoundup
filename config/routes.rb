Rails.application.routes.draw do

  resources :members, only: [:show]
end
