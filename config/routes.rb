Rails.application.routes.draw do
  resources :tests
  resources :users
  resources :skills

  get '/find', to:  "users#find"

  post '/find_results', to:  "users#find_results"
  post '/test/:phase', to:  "skills#validate_answer"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
