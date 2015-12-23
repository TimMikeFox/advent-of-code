#!/usr/bin/env ruby
floor = 0
position = 1
STDIN.each_char do |c|
  floor += 1 if c == '('
  floor -= 1 if c == ')'

  break if floor == -1
  position += 1
end
puts position
