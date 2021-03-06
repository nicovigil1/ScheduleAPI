Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do 
    namespace :v1 do
      resources :schedules, only: [:create, :index]
      delete '/schedules', to: "schedules#destroy"
      get '/schedules/:name', to: "schedules#show"
      resources :appointments, only: [:index]
      post '/appointments/:schedule_name/', to: "appointments#create"
      delete '/appointments/:schedule_name/', to: "appointments#destroy"
    end
  end
end
