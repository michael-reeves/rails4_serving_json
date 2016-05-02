require 'rails_helper'

describe Api::V1::OrdersController, type: :controller do
  fixtures :all

  before(:each) do
    orders = Order.all
    order0 = orders[0]
    order1 = orders[1]
    order2 = orders[2]

    order0.items << Item.first
    order1.items << Item.last
    order2.items << Item.all
  end

  context '#index' do
    it 'successfully returns all orders' do
      get :index, format: :json

      orders = JSON.parse( response.body, symbolize_names: true )
      order  = orders.first

      expect( response ).to have_http_status :success

      expect( orders.count ).to        eq 3
      expect( order[:amount].to_f ).to eq 5000.0
      expect( order[:user_id] ).to     eq 468504389
    end
  end
end
