require 'spec_helper'

describe Occupant do
  let(:occupant) {Occupant.new('Tony', 'Stark')}

  it "has a first name for the occupant" do
      expect(occupant.first_name).to eq('Tony')
  end

  it "has a last name for the occupant" do
    expect(occupant.last_name).to eq('Stark')
  end
end
