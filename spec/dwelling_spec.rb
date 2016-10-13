require 'spec_helper'

describe Dwelling do
  let(:dwelling) {Dwelling.new('890 Fifth Avenue', 'Manhattan', 'New York', '10021')}

  it "has an street address" do
      expect(dwelling.address).to eq('890 Fifth Avenue')
  end

  it "has a city or town" do
    expect(dwelling.city_or_town).to eq('Manhattan')
  end

  it "has a state" do
    expect(dwelling.state).to eq('New York')
  end

  it "has a zip code" do
    expect(dwelling.zip_code).to eq('10021')
  end
end
