require 'rails_helper'

describe Order, type: :model do
  before(:each) do
    user   = User.create!( name: 'Jon Snow', email: 'jon.snow@stark.org' )
    item1  = Item.create!( name: 'Oathkeeper' )
    item2  = Item.create!( name: 'Longclaw' )

    @order = Order.create!( amount: 10.0, user_id: user.id )
    @order.items << [item1, item2]
  end

  it 'has a user' do
    expect( @order.user.name  ).to eq 'Jon Snow'
    expect( @order.user.email ).to eq 'jon.snow@stark.org'
  end

  it 'has items' do
    expect(@order.items.first.name).to eq 'Oathkeeper'
    expect(@order.items.last.name ).to eq 'Longclaw'
  end
end
