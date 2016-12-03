# Describes the individual movement instructions that are provided.
#
# Instructions consist of a direction to turn (right, left) and a number of 
# steps to take.
#********************************************************************************
class Instruction
  attr_reader :direction
  attr_reader :steps

  def initialize(string = "")
    @direction = :unknown
    @steps = 0

    return if string.empty?

    @direction = case string.slice(0,1)
                 when "R" then :right
                 when "L" then :left
                 else :unknown
                 end

    @steps = Integer(string.slice(1,99).strip)
  end
end
