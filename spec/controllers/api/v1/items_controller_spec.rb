require 'rails_helper'

describe Api::V1::ItemsController, type: :controller do
  fixtures :items

  context '#index' do
    it 'successfully returns all items' do
      get :index, format: :json

      items = JSON.parse( response.body, symbolize_names: true )
      item  = items.first

      expect( response ).to           have_http_status :success

      expect( items.count ).to        eq 2
      expect( item[:name] ).to        eq 'Lannister'
      expect( item[:description] ).to eq 'My uncle is my dad'
    end
  end

  context '#show' do
    it 'returns a single item' do
      get :show, format: :json, id: Item.first.id

      item = JSON.parse( response.body, symbolize_names: true )

      expect( response ).to           have_http_status :success

      expect( item[:name] ).to        eq 'Lannister'
      expect( item[:description] ).to eq 'My uncle is my dad'
    end
  end

  context '#create' do
    it 'adds a new item' do
      item_params = { name: 'Arya', description: 'Is not blind' }

      post :create, format: :json, item: item_params

      item      = Item.last
      json_item = JSON.parse( response.body, symbolize_names: true )

      expect( response ).to         have_http_status :success

      expect( item.name ).to        eq 'Arya'
      expect( item.description ).to eq 'Is not blind'

      expect( json_item[:name] ).to        eq 'Arya'
      expect( json_item[:description] ).to eq 'Is not blind'
    end
  end

  context '#update' do
    it 'alters a record' do
      item_params = { name: 'Arya', description: 'Is not blind' }
      old_item    = Item.first

      patch :update, format: :json, id: old_item.id, item: item_params

      new_item    = Item.find_by( id: old_item.id )

      expect(response).to                   have_http_status :success

      expect( new_item.name ).to            eq 'Arya'
      expect( new_item.description ).to     eq 'Is not blind'
      expect( new_item.name ).not_to        eq old_item.name
      expect( new_item.description ).not_to eq old_item.description
    end
  end

end
