require 'rails_helper'

describe Item, type: :model do
  fixtures :items

  before do
    order1 = Order.create!( amount: 39.99 )
    order2 = Order.create!( amount: 200.00 )

    @lannister = Item.first
    @lannister.orders << [order1, order2]
  end

  it '#name exists' do
    expect(@lannister.name).to eq 'Oathkeeper'
  end

  it '#description exists' do
    expect(@lannister.description).to eq "Jamie Lannister's sword"
  end

  it 'has orders' do
    expect( @lannister.orders.count ).to        eq 2
    expect( @lannister.orders.first.amount ).to eq 39.99
    expect( @lannister.orders.last.amount ).to  eq 200.0
  end
end
