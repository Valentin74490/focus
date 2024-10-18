Rails.application.routes.draw do
  devise_for :users

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # Root path
  root "pages#home"

  # Nested routes for projects and tasks
  resources :projects do
    resources :tasks, only: [:new, :create, :edit, :update, :destroy, :show] do
      # Custom routes for starting and stopping work on a task
      member do
        patch :start_work
        patch :stop_work
      end
    end
  end
end

#note pour sid
#j'ai rajouté ces elements mais je dois revenir dessus pour comprendre (sur la partie membe do )
