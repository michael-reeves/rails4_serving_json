require 'rails_helper'

describe Api::V1::ItemsController, type: :controller do

  it '#index' do
    get :index, format: :json

    expect(response).to have_http_status :success
  end

end
