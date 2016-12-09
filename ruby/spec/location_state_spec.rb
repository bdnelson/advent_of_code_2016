require 'location_state'

RSpec.describe "LocationState" do
  describe "#instance" do
    context "defaults" do
      let(:state) { LocationState.instance }

      it "coordinate to the starting location" do
        expect(state.coordinate).not_to be_nil
        expect(state.coordinate.x_coordinate).to eq(0)
        expect(state.coordinate.y_coordinate).to eq(0)
      end

      it "direction to north" do
        expect(state.direction).to eq(:north)
      end
    end
  end

  describe ".move" do
    let(:state) { LocationState.instance }

    it "moves" do
      state.reset
      state.move(Instruction.new("R1"))
      expect(state.direction).to be(:east)
      expect(state.coordinate.x_coordinate).to eq(1)
      expect(state.coordinate.y_coordinate).to eq(0)
      state.move(Instruction.new("R1"))
      expect(state.direction).to be(:south)
      expect(state.coordinate.x_coordinate).to eq(1)
      expect(state.coordinate.y_coordinate).to eq(-1)
      state.move(Instruction.new("L1"))
      expect(state.direction).to be(:east)
      expect(state.coordinate.x_coordinate).to eq(2)
      expect(state.coordinate.y_coordinate).to eq(-1)
      state.move(Instruction.new("L1"))
      expect(state.direction).to be(:north)
      expect(state.coordinate.x_coordinate).to eq(2)
      expect(state.coordinate.y_coordinate).to eq(0)
    end
  end

  describe ".distance_from_start" do
    let(:state) { LocationState.instance }

    it "calculates a distance" do
      state.reset
      state.move(Instruction.new("R1"))
      state.move(Instruction.new("R1"))
      state.move(Instruction.new("L1"))
      state.move(Instruction.new("L1"))
      expect(state.coordinate.x_coordinate).to eq(2)
      expect(state.coordinate.y_coordinate).to eq(0)

      expect(state.distance_from_start).to eq(2)
    end

    it "calculates a distance even with negatives" do
      state.reset
      state.move(Instruction.new("L1"))
      state.move(Instruction.new("L1"))
      state.move(Instruction.new("R1"))
      state.move(Instruction.new("L1"))
      expect(state.coordinate.x_coordinate).to eq(-2)
      expect(state.coordinate.y_coordinate).to eq(-2)

      expect(state.distance_from_start).to eq(4)
    end
  end
end
