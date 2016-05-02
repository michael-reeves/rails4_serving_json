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

  context '#show' do
    it 'displays a single order' do
      get :show, format: :json, id: Order.first.id

      order = JSON.parse( response.body, symbolize_names: true )

      expect(response).to have_http_status :success

      expect( order[:amount].to_f ).to eq 5000.0
      expect( order[:user_id] ).to     eq 468504389
    end
  end

  context '#create' do
    it 'adds a new order' do
      order_params = { amount: 4000.00, user_id: User.first.id }
      
      post :create, format: :json, order: order_params
      
      order      = Order.last
      json_order = JSON.parse( response.body, symbolize_names: true )

      expect(response).to have_http_status :success

      expect( order.amount ).to    eq 4000.0
      expect( order.user.name ).to eq 'Tyrion Lannister'

      expect( json_order[:amount].to_f ).to eq 4000.0
      expect( json_order[:user_id] ).to     eq 468504389
    end
  end

end
