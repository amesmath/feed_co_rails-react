module Api
  module V1
    class ProductsController < ApplicationController
      def create
        @product = Product.new(product_params)
        if @product.save
          render json: { message: 'Product was successfully created.', product: @product }, status: :created
        else
          render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def product_params
        params.require(:product).permit(
          :name, :description, :sku, :price, :cost, :stock_quantity, :product_type, :company_id,
          ingredients_attributes: %i[id weight_needed_per_batch unit_of_measure supplier_product_id _destroy]
        )
      end
    end
  end
end
