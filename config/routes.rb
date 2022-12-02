Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "users/registrations", :sessions => 'users/sessions'}
  resources :users
  resources :skills
  resources :user_skills
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "user_skills#index"
end
