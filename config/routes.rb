Rails.application.routes.draw do

  root 'students#index'

  resources :students do
    resources :classrooms
  end
  resources :courses
end
