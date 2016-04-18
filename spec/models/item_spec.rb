require 'rails_helper'

describe Item, type: :model do
  fixtures :items

  # let(:items) { Item.all }
  let(:lannister) { Item.first }

  it '#name exists' do
    expect(lannister.name).to eq 'Lannister'
  end

  it '#description exists' do
    expect(lannister.description).to eq 'My uncle is my dad'
  end
end
