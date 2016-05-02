require 'rails_helper'

describe User, type: :model do
  fixtures :users, :orders

  let(:tyrion) { User.first }
  
  it '#name exists' do
    expect( tyrion.name ).to eq 'Tyrion Lannister'
  end

  it '#email exists' do
    expect( tyrion.email ).to eq 'tyrion@lannister.com'
  end

  it 'has orders' do
    expect( tyrion.orders.count ).to        eq 2
    expect( tyrion.orders.first.amount ).to eq 5000
    expect( tyrion.orders.last.amount  ).to eq 799.95
  end
end
