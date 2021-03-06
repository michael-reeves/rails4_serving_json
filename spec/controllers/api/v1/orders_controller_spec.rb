require 'rails_helper'

describe Api::V1::OrdersController, type: :controller do
  fixtures :orders, :users

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

      expect( response ).to have_http_status :success

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

      expect( response ).to have_http_status :success

      expect( order.amount ).to    eq 4000.0
      expect( order.user.name ).to eq 'Tyrion Lannister'

      expect( json_order[:amount].to_f ).to eq 4000.0
      expect( json_order[:user_id] ).to     eq 468504389
    end
  end

  context '#update' do
    it 'alters an order' do
      order_params = { amount: 3000.0, user_id: User.second.id }
      old_order    = Order.first

      patch :update, format: :json, id: old_order.id,  order: order_params

      new_order    = Order.find_by( id: old_order.id )

      expect( response ).to have_http_status :success

      expect( new_order.amount ).to     eq 3000.0
      expect( new_order.user.name ).to  eq 'Arya Stark'
      expect( new_order.amount ).not_to eq old_order.amount
      expect( new_order.user ).not_to   eq old_order.user
    end
  end

  context '#destroy' do
    it 'removes an order' do
      expect{ delete :destroy, format: :json, id: Order.first.id }.to change{ Order.count }.by( -1 )
      expect( response ).to have_http_status :success
    end
  end

end
