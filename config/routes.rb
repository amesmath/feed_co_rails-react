Rails.application.routes.draw do
  # Devise routes for user authentication, now scoped under API and versioned
  namespace :api do
    namespace :v1 do
      devise_for :users, controllers: {
        sessions: 'api/v1/sessions'
      }

      # Other API resources
      resources :products, only: %i[index show]
      resources :sales, only: %i[index show]

      # Dashboard routes
      get 'dashboard/index', to: 'dashboard#index', defaults: { format: :json }
      get 'dashboard/search', to: 'dashboard#search'
    end
  end

  # Set the root to the dashboard API endpoint
  root 'api/v1/dashboard#index'
end
