class Api::V1::OrdersController < ApplicationController
  respond_to :json

  def index
    respond_with Order.all
  end
end
