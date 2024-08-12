Rails.application.routes.draw do
  # Devise routes for user authentication
  devise_for :users

  # Namespace all routes under the API with versioning
  namespace :api do
    namespace :v1 do
      resources :products, only: %i[index show]
      resources :sales, only: %i[index show]
      get 'dashboard/index', to: 'dashboard#index', defaults: { format: :json }
      get 'dashboard/search', to: 'dashboard#search'
    end
  end

  # Set the root to the dashboard API endpoint
  root 'api/v1/dashboard#index'
end
