require 'spec_helper'

describe Truck do
  let(:mr_stark) {Occupant.new('Tony', 'Stark')}
  let(:the_donald) {Occupant.new('Donald', 'Trump')}
  let(:truck) {Truck.new}

  describe "#full?" do
    context "truck IS full" do
      it "checks to see if the truck is full and returns true" do
        40.times  { truck.add_box(mr_stark)}
        expect(truck.full?).to eq(true)
      end
    end

    context "truck is NOT full" do
      it "checks to see if the truck is full and returns false" do
        truck.add_box(mr_stark)
        truck.add_box(mr_stark)
        truck.add_box(mr_stark)
        truck.add_box(mr_stark)
        expect(truck.full?).to eq(false)
      end
    end
  end
  describe "#add_box" do
    context "truck IS full" do
      it "does NOT add a box and returns false" do
        40.times  { truck.add_box(the_donald)}
        expect(truck.full?).to eq(true)
        expect(truck.add_box(the_donald)).to eq(false)
      end
    end

    context "truck is NOT full" do
      it "does add a box and returns true" do
        20.times  { truck.add_box(mr_stark)}
        expect(truck.full?).to eq(false)
        expect(truck.add_box(the_donald)).to eq(true)
      end
    end
  end

  describe "#remove_box" do
    context "truck IS empty" do
      it "does NOT remove a box and returns false" do
        expect(truck.remove_box).to eq(false)
      end
    end

    context "truck is NOT empty" do
      it "does remove a box and returns true" do
        19.times  { truck.add_box(mr_stark)}
        truck.add_box(the_donald)
        expect(truck.remove_box).to eq(true)
        expect(truck.manifest.size).to eq(19)
        expect(truck.boxes).to eq(19)
      end
    end
  end

  describe "#unload_all" do
    context "truck IS empty" do
      it "does NOT remove a box and returns false" do
        expect(truck.unload_all(the_donald)).to eq(false)
      end
    end

    context "truck is NOT empty" do
      it "unloads all of the boxes of a single person" do
        10.times  { truck.add_box(mr_stark)}
        19.times  { truck.add_box(the_donald)}
        expect(truck.unload_all(the_donald)).to eq(true)
        expect(truck.manifest.size).to eq(10)
        expect(truck.boxes).to eq(10)
      end
    end
  end
end
