#!/usr/bin/env ruby

$:.unshift(File.expand_path("../lib", __FILE__))
require 'instruction_set'
require 'location_state'

if ARGV.length > 0
  instructions = File.readlines(ARGV.first).join
else
  puts "USAGE: exercise01.rb <input_file>"
  exit
end

set = InstructionSet.new(instructions)
state = LocationState.instance
locations = {}

set.instructions.each do |instruction|
  state.move(instruction)
end

state.locations.each do |loc|
  if locations[loc].nil?
    locations[loc] = 1
  else
    puts "First Duplicate Location: #{loc}"
    break
  end
end

puts
puts "Instructions: #{instructions}"
puts "Ending Location: (#{state.coordinate.x_coordinate}, #{state.coordinate.y_coordinate})"
puts "Direction: #{state.direction}"
