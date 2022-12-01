Rails.application.routes.draw do
  resources :users
  resources :skills

  get '/find', to:  "users#find"

  post '/find_results', to:  "users#find_results"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
