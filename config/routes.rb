Rails.application.routes.draw do
  resources :users , except: [ :update ]
end
