#!/usr/bin/env ruby
#
# --- Day 1: No Time for a Taxicab ---
# 
# You're airdropped near Easter Bunny Headquarters in a city somewhere.
# "Near", unfortunately, is as close as you can get - the instructions on
# the Easter Bunny Recruiting Document the Elves intercepted start here,
# and nobody had time to work them out further.
# 
# The Document indicates that you should start at the given coordinates
# (where you just landed) and face North. Then, follow the provided
# sequence: either turn left (L) or right (R) 90 degrees, then walk
# forward the given number of blocks, ending at a new intersection.
# 
# There's no time to follow such ridiculous instructions on foot, though,
# so you take a moment and work out the destination. Given that you can
# only walk on the street grid of the city, how far is the shortest path
# to the destination?
# 
# For example:
# 
# Following R2, L3 leaves you 2 blocks East and 3 blocks North, or 5 blocks away.
# R2, R2, R2 leaves you 2 blocks due South of your starting position, which is 2 blocks away.
# R5, L5, R5, R3 leaves you 12 blocks away.
# How many blocks away is Easter Bunny HQ?

NORTH = [0, 1]
SOUTH = [0, -1]
EAST  = [1, 0]
WEST  = [-1, 0]

compass = [NORTH, EAST, SOUTH, WEST]

orientation = 0
position    = [0, 0]

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
  end
end

puts "location at #{position} which is #{position[0] + position[1]} blocks away"
