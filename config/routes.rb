Rails.application.routes.draw do
  resources :teachers
  resources :students

  root 'homes#index'
end
