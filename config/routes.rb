Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users
  post 'users/rating', to: 'users#rating', as: 'rating' # named route other than default CRUD routes 
end
