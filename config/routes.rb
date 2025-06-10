Rails.application.routes.draw do
  resources :profiles, only: [ :new, :create ]
  resources :posts
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  get "profiles/:id/show_extra", to: "profiles#show_extra", as: "profile_show_extra"
  # composite key routing
  get "universities/:university_id/departments/:id", to: "universities#department_info", as: "university_department"

   root "posts#index"
  # root "profiles#new"
end
