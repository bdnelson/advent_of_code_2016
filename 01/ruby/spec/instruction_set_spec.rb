require 'instruction_set'

RSpec.describe "InstructionSet" do
  let(:example0) { "R3" }
  let(:example1) { "R2, L3" }
  let(:example2) { "R2, R2, R2" }
  let(:example3) { "R5, L5, R5, R3" }

  describe "#new" do
    context "defaults" do
      let(:set) { InstructionSet.new }

      it "defaults to an empty set of instructions" do
        expect(set.instructions).to be_empty
      end
    end

    context "empty string" do
      let(:set) { InstructionSet.new("") }
      let(:set2) { InstructionSet.new("     ") }

      it "results in an empty set of instructions on an empty string" do
        expect(set.instructions).to be_empty
      end

      it "results in an empty set of instructions on an white-space string" do
        expect(set2.instructions).to be_empty
      end
    end

    context "single instruction" do
      let(:set) { InstructionSet.new("R1") }

      it "results in a single instruction" do
        expect(set.instructions.length).to be(1)
      end
    end

    context "multiple instructions" do
      let(:set) { InstructionSet.new("R1, R2, R3") }

      it "results in the correct number of instructions" do
        expect(set.instructions.length).to be(3)
      end
    end
  end
end
