require 'spec_helper'

describe House do
  let(:house) {House.new('890 Fifth Avenue', 'Manhattan', '10021', 999999999)}

  it "has an street address" do
      expect(house.address).to eq('890 Fifth Avenue')
  end

  it "has a city or town" do
    expect(house.city_or_town).to eq('Manhattan')
  end

  it "has a zip code" do
    expect(house.zip_code).to eq('10021')
  end

  it "has an asking price" do
    expect(house.asking_price).to eq(999999999)
  end
end
