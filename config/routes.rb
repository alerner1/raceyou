Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # models are: runners, races, registrations, friends, friendships
  #             stats, rank_categories  
  # want to access pages for runners, races, registrations, rank_categories
  # within those pages, we'll be accessing stats, friends, friendships, etc
  #
  # starting out with all resources available, will limit them later
  # 
  # will need to set things up so you can see info about a runner without
  # being logged in, but need to login to do certain things like register for a race              

  resources :runners
  resources :races
  resources :registrations
  resources :rank_categories
  resources :friendships
  resources :stats

  post '/login', to: 'sessions#login', as: 'login'
  get '/sessions/new', to: 'sessions#new', as: 'new_login'

  delete '/logout', to: 'sessions#logout', as: 'logout'
end
