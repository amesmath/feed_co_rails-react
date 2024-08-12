module Api
  module V1
    class SalesController < ApplicationController
      def index
        sales = Sale.all
        render json: sales, status: :ok
      end

      def show
        sale = Sale.find_by(id: params[:id])
        if sale
          render json: sale, status: :ok
        else
          render json: { error: 'Sale not found' }, status: :not_found
        end
      end
    end
  end
end
