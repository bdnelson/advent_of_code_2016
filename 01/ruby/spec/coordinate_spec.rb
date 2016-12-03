require 'coordinate'

RSpec.describe "Coordinate" do
  describe "#new" do
    context "defaults" do
      let(:coordinate) { Coordinate.new }

      it "defaults to starting location" do
        expect(coordinate.x_coordinate).to be(0)
        expect(coordinate.y_coordinate).to be(0)
      end
    end

    context "x-coordinate only" do
      let(:coordinate) { Coordinate.new(1) }

      it "initializes to the correct location" do
        expect(coordinate.x_coordinate).to be(1)
        expect(coordinate.y_coordinate).to be(0)
      end
    end

    context "full location" do
      let(:coordinate) { Coordinate.new(1, 2) }

      it "initializes to the correct location" do
        expect(coordinate.x_coordinate).to be(1)
        expect(coordinate.y_coordinate).to be(2)
      end
    end
  end
end
