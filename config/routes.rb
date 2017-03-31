Rails.application.routes.draw do 
  resources :students, only: :show
  resources :teachers, only: [:index, :destroy]

  root 'health_check#index'

end
