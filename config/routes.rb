Rails.application.routes.draw do
  # Default all routes to JSON format
  scope format: true, constraints: { format: :json } do
    namespace :api do
      namespace :v1 do
        devise_for :users, controllers: {
          sessions: 'api/v1/sessions'
        }

        resources :products, only: %i[index show]
        resources :sales, only: %i[index show]

        # Update these routes
        get 'dashboard', to: 'dashboard#index'
        get 'dashboard/search', to: 'dashboard#search'
      end
    end
  end

  # Set the root to the dashboard API endpoint
  root 'api/v1/dashboard#index', defaults: { format: :json }
end
