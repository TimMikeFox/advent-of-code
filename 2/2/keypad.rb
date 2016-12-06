#!/usr/bin/env ruby
#
# 
# --- Part Two ---
# 
# You finally arrive at the bathroom (it's a several minute walk from
# the lobby so visitors can behold the many fancy conference rooms and
# water coolers on this floor) and go to punch in the code. Much to
# your bladder's dismay, the keypad is not at all like you imagined it.
# Instead, you are confronted with the result of hundreds of man-hours of
# bathroom-keypad-design meetings:
# 
#       1
#     2 3 4
#   5 6 7 8 9
#     A B C
#       D
# 
# You still start at "5" and stop when you're at an edge, but given the
# same instructions as above, the outcome is very different:
# 
# You start at "5" and don't move at all (up and left are both edges),   .
# ending at 5 Continuing from "5", you move right twice and down three   .
# times (through "6", "7", "B", "D", "D"), ending at D Then, from "D",   .
# you move five more times (through "D", "B", "C", "C", "B"), ending at  .
# B Finally, after five more moves, you end at 3 So, given the actual    .
# keypad layout, the code would be 5DB3                                  .
# 
# Using the same instructions in your puzzle input, what is the correct
# bathroom code?

DEBUG = false

keypad = [ [ 'X','X','X','X','X','X','X' ] ,
           [ 'X','X','X','1','X','X','X' ] ,
           [ 'X','X','2','3','4','X','X' ] ,
           [ 'X','5','6','7','8','9','X' ] ,
           [ 'X','X','A','B','C','X','X' ] ,
           [ 'X','X','X','D','X','X','X' ] ,
           [ 'X','X','X','X','X','X','X' ] ]

position = [ 1 , 3 ]

STDIN.each_line do |line|
  line.each_char do |c|
    previous = position.clone
    case c
    when 'U'
      position[1] = position[1] - 1
    when 'D'
      position[1] = position[1] + 1
    when 'L'
      position[0] = position[0] - 1
    when 'R'
      position[0] = position[0] + 1
    end
    puts "command #{c} moves position to #{position}" if DEBUG
    if keypad[position[1]][position[0]] == 'X'
      puts "cannot move off the keypad, reverting to #{previous}" if DEBUG
      position = previous
    end
  end
  print keypad[position[1]][position[0]]
end
