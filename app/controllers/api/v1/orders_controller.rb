class Api::V1::OrdersController < ApplicationController
  respond_to :json

  def index
    respond_with Order.all
  end

  def show
    respond_with Order.find_by( id: params[:id] )
  end
end
