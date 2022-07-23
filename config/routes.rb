Rails.application.routes.draw do
  resources :users, only: [:show, :index, :create]
end
