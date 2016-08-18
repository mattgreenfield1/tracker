Rails.application.routes.draw do

  resources :workout_classes
  root 'home#index'

  get '/calendar', to: 'calendar#index'
  get '/load', to: 'workout_transactions#load'
  post '/parse', to: 'workout_transactions#parse'
  
  resources :workout_transactions
  resources :cardio_definitions
  resources :mma_definitions
  resources :weightlifting_definitions
  resources :workout_definitions

end
