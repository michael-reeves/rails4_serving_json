require 'rails_helper'

describe Api::V1::OrdersController, type: :controller do
  fixtures :orders

  context '#index' do
    it 'successfully returns all orders' do
      get :index, format: :json

      orders = JSON.parse( response.body, symbolize_names: true )
      order  = orders.first

      expect(response).to have_http_status :success

      expect(orders.count).to        eq 3
      expect(order[:amount].to_f).to eq 5000
      expect(order[:user_id]).to     eq 2
    end
  end
end
