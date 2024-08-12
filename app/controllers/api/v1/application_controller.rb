module Api
  module V1
    class ApplicationController < ActionController::API
      before_action :bypass_login_for_demo

      private

      def bypass_login_for_demo
        return unless Rails.env.production? && ENV['DEMO_MODE'] == 'true'

        # Example user bypass
        user = User.find_by(email: 'demo@example.com')

        return unless user

        # For an API, you would likely issue a token here
        # You can use JWT or another token-based system
        token = user.generate_jwt_token # Ensure you have a method to generate a token in the User model
        response.set_header('Authorization', "Bearer #{token}")
      end
    end
  end
end
