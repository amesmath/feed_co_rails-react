module Api
  module V1
    class DashboardController < ApplicationController
      def index
        @purchase_order_data = purchase_order_data_for_chart
        @companies = with_more_than_ten_products
        @low_stock_products = Product.where(company_id: internal_company_ids)
                                     .order(:stock_quantity)
                                     .limit(5)
        @products_with_ingredients = Product.where(company_id: internal_company_ids)
                                            .includes(ingredients: { supplier_product: :company })

        @top_products = Product.where(company_id: internal_company_ids)
                               .order(sales_count: :desc)
                               .limit(12)

        render json: {
          purchase_order_data: @purchase_order_data,
          companies: @companies.as_json,
          low_stock_products: @low_stock_products.as_json,
          products_with_ingredients: @products_with_ingredients.as_json(include: {
                                                                          ingredients: { include: { supplier_product: { only: %i[
                                                                            name id price
                                                                          ] } } }
                                                                        }),
          top_products: @top_products.as_json
        }, status: :ok
      end

      def search
        query = params[:query]
        @products_with_ingredients = Product.where('name ILIKE ?', "%#{query}%")
                                            .where(company_id: internal_company_ids)
                                            .includes(ingredients: { supplier_product: :company })

        render json: @products_with_ingredients.as_json(
          include: { ingredients: { include: { supplier_product: { include: :company } } } }
        ), status: :ok
      end

      private

      def internal_company_ids
        Company.where(is_internal: true).pluck(:id)
      end

      def with_more_than_ten_products
        Company.joins(:products)
               .group('companies.id')
               .having('COUNT(products.id) > 16')
               .select('companies.*, COUNT(products.id) as product_count')
      end

      def purchase_order_data_for_chart
        # Get purchase orders for the last 3 months
        start_date = 3.months.ago.to_date
        end_date = Date.today

        # Group by date and count the number of orders per day
        purchase_orders = PurchaseOrder
                          .where(company_id: internal_company_ids, order_date: start_date..end_date)
                          .group('DATE(order_date)')
                          .count

        # Format data for Highcharts or any other charting library
        purchase_orders.map { |date, count| { date: date.strftime('%Y-%m-%d'), count: } }
      end
    end
  end
end
