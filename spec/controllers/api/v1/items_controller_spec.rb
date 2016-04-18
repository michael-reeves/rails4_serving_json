require 'rails_helper'

describe Api::V1::ItemsController, type: :controller do
  fixtures :items

  context '#index' do
    it 'successfully returns all items' do
      get :index, format: :json

      items = JSON.parse( response.body, symbolize_names: true )
      item  = items.first

      expect(response).to have_http_status :success

      expect(items.count).to        eq 2
      expect(item[:name]).to        eq 'Lannister'
      expect(item[:description]).to eq 'My uncle is my dad'
    end
  end

  context '#show' do
    it 'returns a single item' do
      get :show, format: :json, id: Item.first.id
      
      item = JSON.parse( response.body, symbolize_names: true )

      expect(response).to have_http_status :success

      expect(item[:name]).to eq 'Lannister'
      expect(item[:description]).to eq 'My uncle is my dad'
    end
  end

end
