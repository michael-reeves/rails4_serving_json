require 'rails_helper'

describe User, type: :model do
  let(:lannister) { User.first }
  
  it '#name exists' do
    expect( lannister.name ).to eq 'Tyrion Lannister'
  end

  it '#email exists' do
    expect( lannister.email ).to eq 'tyrion@lannister.com'
  end
end
