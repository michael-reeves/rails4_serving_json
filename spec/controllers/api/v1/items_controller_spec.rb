require 'rails_helper'

describe Api::V1::ItemsController, type: :controller do
  fixtures :items

  it '#index' do
    get :index, format: :json

    items = JSON.parse( response.body )
    item  = items.first

    expect(response).to have_http_status :success
    
    expect(items.count).to         eq 2
    expect(item['name']).to        eq 'Lannister'
    expect(item['description']).to eq 'My uncle is my dad'
  end

end
