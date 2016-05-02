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

  def update
    respond_with Order.update(params[:id], order_params)
  end

  private

    def order_params
      params.require(:order).permit(:amount, :user_id)
    end
end
