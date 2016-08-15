Rails.application.routes.draw do

  root 'home#index'
  
  resources :workout_transactions
  resources :cardio_definitions
  resources :mma_definitions
  resources :weightlifting_definitions
  resources :workout_definitions
end
