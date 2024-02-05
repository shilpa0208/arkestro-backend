Rails.application.routes.draw do
  resources :login, only: [:create]
    delete :logout, to: "login#logout"
    get :logged_in, to: "login#logged_in" # to see if logged in

  resources :registrations, only: [:create]

  resources :projects, only: [:index]
    put 'projects/:id', to: "projects#update"

  resources :subtasks, only: [:index]
end
