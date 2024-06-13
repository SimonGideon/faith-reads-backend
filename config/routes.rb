Rails.application.routes.draw do
  namespace :v1 do
    devise_for :users, path: '', path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      registration: 'signup'
    },
    controllers: {
      sessions: 'v1/users/sessions',
      registrations: 'v1/users/registrations'
    }
    get "up" => "rails/health#show", as: :rails_health_check
  
    # Defines the root path route ("/")
    # root "posts#index"
  end
end
