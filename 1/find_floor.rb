#!/usr/bin/env ruby
floor = 0
STDIN.each_char do |c|
  floor += 1 if c == '('
  floor -= 1 if c == ')'
end
puts floor
