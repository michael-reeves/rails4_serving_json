require 'rails_helper'

describe Api::V1::UsersController, type: :controller do
  fixtures :users

  context '#index' do
    it 'successfully returns all users' do
      get :index, format: :json

      users = JSON.parse( response.body, symbolize_names: true )
      user  = users.first

      expect( response ).to have_http_status :success

      expect( users.count  ).to eq 3
      expect( user[:name]  ).to eq 'Tyrion Lannister'
      expect( user[:email] ).to eq 'tyrion@lannister.com'
    end
  end

  context '#show' do
    it 'returns a single user' do
      get :show, format: :json, id: User.first.id

      user = JSON.parse( response.body, symbolize_names: true )

      expect( response ).to have_http_status :success

      expect( user[:name]  ).to eq 'Tyrion Lannister'
      expect( user[:email] ).to eq 'tyrion@lannister.com'
    end
  end

  context '#create' do
    it 'adds a new user' do
      user_params = { name: 'Arya Stark', email: 'arya@stark.org' }

      post :create, format: :json, user: user_params

      user = User.last
      json_user = JSON.parse( response.body, symbolize_names: true )

      expect( response ).to have_http_status :success

      expect( user.name  ).to eq 'Arya Stark'
      expect( user.email ).to eq 'arya@stark.org'

      expect( json_user[:name]  ).to eq 'Arya Stark'
      expect( json_user[:email] ).to eq 'arya@stark.org'
    end
  end

  context '#update' do
    it 'alters a record' do
      user_params = { name: 'Arya Stark', email: 'arya@stark.org' }
      old_user    = User.first

      patch :update, format: :json, id: old_user.id, user: user_params

      new_user    = User.find_by( id: old_user.id )

      expect( response ).to have_http_status :success

      expect( new_user.name  ).to     eq 'Arya Stark'
      expect( new_user.email ).to     eq 'arya@stark.org'
      expect( new_user.name  ).not_to eq old_user.name
      expect( new_user.email ).not_to eq old_user.email
    end
  end

  context '#destroy' do
    it 'removes a record' do
      expect { delete :destroy, format: :json, id: User.first.id }.to change{ User.count }.by( -1 )

      expect( response ).to have_http_status :success
    end
  end

end
