require 'spec_helper'

describe Appartment do
  let(:mr_stark) {Occupant.new('Tony', 'Stark')}
  let(:the_donald) {Occupant.new('Donald', 'Trump')}
  let(:appartment) {Appartment.new('200 Park Avenue', 'Manhattan', '10166', 100000, '11/10/16', '05/04/18')}

  it "has an street address" do
      expect(appartment.address).to eq('200 Park Avenue')
  end

  it "has a city or town" do
    expect(appartment.city_or_town).to eq('Manhattan')
  end

  it "has a zip code" do
    expect(appartment.zip_code).to eq('10166')
  end

  it "has a monthly rent amount" do
    expect(appartment.rent).to eq(100000)
  end

  it "has a start date for the lease" do
    expect(appartment.lease_start_date).to eq('11/10/16')
  end

  it "has a end date for the lease" do
    expect(appartment.lease_end_date).to eq('05/04/18')
  end

  describe "#full?" do
    context "there IS room for another roomate" do
      it "checks to see if the appartment is full and returns false" do
        appartment.add_roomate
        appartment.add_roomate
        expect(appartment.full?).to eq(false)
      end
    end
    context "there is NOT room for another roomate" do
      it "checks to see if the appartment is full and returns true" do
        appartment.add_roomate
        appartment.add_roomate
        appartment.add_roomate
        appartment.add_roomate
        expect(appartment.full?).to eq(true)
      end
    end
  end

  describe "#add_roomate" do
    context "the appartment is NOT full" do
      it "adds an occupant" do
        expect(appartment.add_roomate).to eq(true)
        expect(appartment.roomates).to eq(1)
      end
    end
    context "the appartment IS full" do
      it "doesn't add an occupant" do
        appartment.add_roomate
        appartment.add_roomate
        appartment.add_roomate
        appartment.add_roomate
        expect(appartment.add_roomate).to eq(false)
        expect(appartment.roomates).to eq(4)
      end
    end
  end

  describe "#remove_roomate" do
    context "the appartment is NOT empty" do
      it "removes an occupant" do
        appartment.add_roomate
        appartment.add_roomate
        expect(appartment.remove_roomate).to eq(true)
        expect(appartment.roomates).to eq(1)
      end
    end
    context "the appartment IS empty" do
      it "doesn't remove an occupant" do
        expect(appartment.roomates).to eq(0)
        expect(appartment.remove_roomate).to eq(false)
      end
    end
  end
end
