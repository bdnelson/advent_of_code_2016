#!/usr/bin/env ruby
$:.unshift(File.expand_path("../lib", __FILE__))

class Keypad
  attr_reader :current_number
  attr_reader :past_numbers
  attr_reader :code

  def initialize
    @current_number = 5
    @past_number = [5]
    @code = []
  end

  def process_line(line)
    line.strip.scan(/\w/).each do |instruction|
      move(instruction)
    end
    @code << @current_number
  end

  # Based on a keypad of:
  #
  # 1 2 3
  # 4 5 6
  # 7 8 9
  #
  def move(instruction)
    @current_number = if instruction == "U" and @current_number > 3
                        @current_number - 3
                      elsif instruction == "D" and @current_number < 7
                        @current_number + 3
                      elsif instruction == "L" and ![1,4,5].include?(@current_number)
                        @current_number - 1
                      elsif instruction ==  "R" and ![3,6,9].include?(@current_number)
                        @current_number + 1
                      else
                        @current_number
                      end

    @past_number << @current_number
  end
end

if ARGV.length < 1
  puts "USAGE: exercise02.rb <inputfile>"
  exit
end

keypad = Keypad.new
File.readlines(ARGV.first).each do |line|
  keypad.process_line(line)
end

puts keypad.code.join

