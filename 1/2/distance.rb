#!/usr/bin/env ruby
#
# --- Part Two ---
# 
# Then, you notice the instructions continue on the back of the Recruiting
# Document. Easter Bunny HQ is actually at the first location you visit
# twice.
# 
# For example, if your instructions are R8, R4, R4, R8, the first location
# you visit twice is 4 blocks away, due East.
# 
# How many blocks away is the first location you visit twice?

NORTH = [0, 1]
SOUTH = [0, -1]
EAST  = [1, 0]
WEST  = [-1, 0]

compass = [NORTH, EAST, SOUTH, WEST]

orientation = 0
position    = [0, 0]

require 'set'
breadcrumbs = Set.new
breadcrumbs << position
found = false

STDIN.each_line do |line|
  direction, count = /(\w)(\d+)/.match(line)[1..2]
  case direction
  when 'R'
    orientation = (orientation + 1) % 4
  when 'L'
    orientation = (orientation - 1) % 4
  end
  count.to_i.times do
    position = [position, compass[orientation]].transpose.map { |x| x.reduce(:+) }
    unless breadcrumbs.add?(position)
      found = true
      break
    end
  end
  break if found
end

puts "location at #{position} which is #{position[0] + position[1]} blocks away"
