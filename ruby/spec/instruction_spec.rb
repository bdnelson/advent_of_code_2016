require 'instruction'

RSpec.describe "Instruction" do
  describe "#new" do
    context "defaults" do
      let(:defaults) { Instruction.new }
      it "has a default direction" do
        expect(defaults.direction).to be(:unknown)
      end

      it "has a default number of steps" do
        expect(defaults.steps).to be(0)
      end
    end

    context "direction" do
      let(:right) { Instruction.new("R1") }
      let(:left) { Instruction.new("L1") }

      it "R1" do
        expect(right.direction).to be(:right)
      end
      it "L1" do
        expect(left.direction).to be(:left)
      end
    end

    context "steps" do
      let(:one) { Instruction.new("L1") }
      let(:neg) { Instruction.new("L-1") }
      let(:zero) { Instruction.new("L0") }
      let(:large) { Instruction.new("L9999999") }

      it "accepts positive steps" do
        expect(one.steps).to be(1)
      end

      it "accepts no steps" do
        expect(zero.steps).to be(0)
      end

      it "accepts negative step values" do
        expect(neg.steps).to be(-1)
      end

      it "accepts large numbers of steps" do
        expect(large.steps).to be(9999999)
      end
    end
  end
end
