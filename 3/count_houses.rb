#!/usr/bin/env ruby
require 'set'

count = 1
location = [0,0]
visited_locations = Set.new
visited_locations << location
STDIN.each_char do |c|
    x, y = location
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
    location = [x,y]
    visited_locations << location
end
puts visited_locations.count
