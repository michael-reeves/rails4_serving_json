require 'rails_helper'

describe User, type: :model do
  fixtures :users

  let(:lannister) { User.first }
  
  it '#name exists' do
    expect( lannister.name ).to eq 'Tyrion Lannister'
  end

  it '#email exists' do
    expect( lannister.email ).to eq 'tyrion@lannister.com'
  end

  it 'has orders' do
    lannister.orders << Order.create!( amount: 100.0 )
    lannister.orders << Order.create!( amount: 599.99 )

    expect( lannister.orders.count ).to        eq 2
    expect( lannister.orders.first.amount ).to eq 100.0
    expect( lannister.orders.last.amount  ).to eq 599.99
  end
end
