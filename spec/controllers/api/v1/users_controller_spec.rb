require 'rails_helper'

describe Api::V1::UsersController, type: :controller do
  fixtures :users

  context '#index' do
    it 'successfully returns all users' do
      get :index, format: :json

      users = JSON.parse( response.body, symbolize_names: true )
      user  = users.first

      expect( response ).to     have_http_status :success

      expect( users.count ).to  eq 2
      expect( user[:name] ).to  eq 'Tyrion Lannister'
      expect( user[:email] ).to eq 'tyrion@lannister.com'
    end
  end

end
