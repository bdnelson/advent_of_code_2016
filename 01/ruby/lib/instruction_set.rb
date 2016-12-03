require 'instruction'

# Describes a set of instructions that are provided as input.
#
# Instruction sets are provided as a comma-delimited string of 
# instructions (e.g. "R5, L5, R5, R3").
class InstructionSet
  attr_reader :instructions

  def initialize(string = "")
    @instructions = string.strip.split(",").map(&:strip).map {|instruction| Instruction.new(instruction)}
  end
end
