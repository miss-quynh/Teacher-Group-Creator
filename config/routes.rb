Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => "homes#index"

  resources :teachers do
    resources :students
  end

  resources :students
  resource :sessions, only: [:create, :destroy]

end
