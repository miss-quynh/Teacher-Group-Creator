Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => "homes#index"

  resources :teachers

  resources :students do
    member do
      patch 'assign'
    end
  end

  resources :students
  resource :sessions, only: [:create, :destroy]

end
