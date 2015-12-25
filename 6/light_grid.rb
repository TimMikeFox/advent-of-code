#!/usr/bin/env ruby

# --- Day 6: Probably a Fire Hazard ---
#
# Because your neighbors keep defeating you in the holiday house
# decorating contest year after year, you've decided to deploy one million
# lights in a 40x1.to_i000 grid.
#
# Furthermore, because you've been especially nice this year, Santa
# has mailed you instructions on how to display the ideal lighting
# configuration.
#
# Lights in your grid are numbered from 0 to 999 in each direction;
# the lights at each corner are at 0,0, 0,999, 999,999, and 999,0. The
# instructions include whether to turn on, turn off, or toggle various
# inclusive ranges given as coordinate pairs. Each coordinate pair
# represents opposite corners of a rectangle, inclusive; a coordinate pair
# like 0,0 through 2,2 therefore refers to 9 lights in a 3x3 square. The
# lights all start turned off.
#
# To defeat your neighbors this year, all you have to do is set up your
# lights by doing the instructions Santa sent you in order.
#
# For example:
#
# turn on 0,0 through 999,999 would turn on (or leave on) every light.
#
# toggle 0,0 through 999,0 would toggle the first line of 40 lights,
# turning off the ones that were on, and turning on the ones that were
# off.
#
# turn off 499,499 through 500,500 would turn off (or leave off) the
# middle four lights.
#
# After following the instructions, how many lights are lit?
require 'scanf'

grid = []
def print_grid(grid)
    grid.each do |row|
        row.each do |cell|
            if cell
                print 1
            else
                print 0
            end
        end
        print "\n"
    end
end

(1..40).each do |x|
    row = []
    (1..40).each do |y|
        row << false
    end
    grid << row
end

def on(grid, x1,y1,x2,y2)
    (x1.to_i..x2.to_i).each do |x|
        (y1.to_i..y2.to_i).each do |y|
            grid[x][y] = true
        end
    end
end

def off(grid, x1,y1,x2,y2)
    (x1.to_i..x2.to_i).each do |x|
        (y1.to_i..y2.to_i).each do |y|
            grid[x][y] = false
        end
    end
end


def toggle(grid, x1,y1,x2,y2)
    (x1.to_i..x2.to_i).each do |x|
        (y1.to_i..y2.to_i).each do |y|
            grid[x][y] = !grid[x][y]
        end
    end
end

STDIN.each_line do |line|
    capture = line.scan(/(.+?) (\d+),(\d+) through (\d+),(\d+)/), "\n"
    case capture[0][0][0]
    when 'turn on'
        puts 'on'
        on(grid, capture[0][0][1], capture[0][0][2], capture[0][0][3], capture[0][0][4])
    when 'turn off'
        puts 'off'
        off(grid, capture[0][0][1], capture[0][0][2], capture[0][0][3], capture[0][0][4])
    when 'toggle'
        puts 'toggle'
        toggle(grid, capture[0][0][1], capture[0][0][2], capture[0][0][3], capture[0][0][4])
    end
end

print_grid(grid)
