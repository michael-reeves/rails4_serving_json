require 'rails_helper'

describe Order, type: :model do
  before(:each) do
    user   = User.create!( name: 'Jon Snow', email: 'jon.snow@stark.org' )
    @order = Order.create!( amount: 10.0, user_id: user.id )
  end

  it 'has a user' do
    expect( @order.user.name  ).to eq 'Jon Snow'
    expect( @order.user.email ).to eq 'jon.snow@stark.org'
  end
end
