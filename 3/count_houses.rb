#!/usr/bin/env ruby
require 'set'

count = 1
locations = [[0,0],[0,0]]
visited_locations = Set.new
visited_locations << [0,0]
STDIN.each_char do |c|
    x, y = locations.shift
    case c
    when '<'
        x -= 1
    when '>'
        x += 1
    when '^'
        y += 1
    when 'v'
        y -= 1
    end
    locations << [x,y]
    visited_locations << [x,y]
end
puts visited_locations.count
