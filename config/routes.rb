Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  namespace :api do
    namespace :v1 do
      resources :reservations
      resources :guests
      resources :restourants
      resources :tables
    end
  end
end
