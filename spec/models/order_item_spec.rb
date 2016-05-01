require 'rails_helper'

describe OrderItem, type: :model do
  it 'exists' do 
    order_item = OrderItem.new

    expect(order_item).to be_an_instance_of OrderItem
  end
end
