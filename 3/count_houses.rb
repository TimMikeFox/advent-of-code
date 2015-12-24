#!/usr/bin/env ruby
count = 1
STDIN.each_char do |c|
    count += 1 if ['<','>','^','v'].include? c
end
puts count
