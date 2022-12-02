Rails.application.routes.draw do
  resources :comments
  resources :posts
  devise_for :users, :controllers => {:registrations => "users/registrations", :sessions => 'users/sessions'}
  resources :tests
  resources :users
  resources :skills

  get '/find', to:  "users#find"

  post '/find_results', to:  "users#find_results"
  post '/test/:phase', to:  "skills#validate_answer"

  get '/user/:user_id/skill/:skill_id/update_rank', to:  "user_skills#update_rank"

  resources :user_skills

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "user_skills#index"
end
