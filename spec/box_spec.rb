require 'spec_helper'

describe Box do
  let(:occupant) {Occupant.new('Tony', 'Stark')}
  let(:box) {Box.new(occupant)}

  it "has a first name for the occupant" do
      expect(box.owner.first_name).to eq('Tony')
  end

  it "has a last name for the occupant" do
    expect(box.owner.last_name).to eq('Stark')
  end
end
