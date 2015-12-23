#!/usr/bin/env ruby
total = 0
STDIN.each_line do |line|
    l, w, h = line.split('x').map! { |x| x.to_i }
    sides = [ 2*(l+w), 2*(w+h), 2*(h+l) ]
    volume = l * w * h
    total += sides.min + volume
end
puts total
