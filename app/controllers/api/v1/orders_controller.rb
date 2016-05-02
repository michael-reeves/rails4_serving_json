class Api::V1::OrdersController < ApplicationController
  respond_to :json

  def index
    respond_with Order.all
  end

  def show
    respond_with Order.find_by( id: params[:id] )
  end

  def create
    respond_with Order.create(order_params), location: nil
  end

  private

    def order_params
      params.require(:order).permit(:amount, :user_id)
    end
end
