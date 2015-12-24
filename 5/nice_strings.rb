#!/usr/bin/env ruby

# --- Day 5: Doesn't He Have Intern-Elves For This? ---
# 
# Santa needs help figuring out which strings in his text file are naughty
# or nice.
# 
# A nice string is one with all of the following properties:
# 
# It contains at least three vowels (aeiou only), like aei, xazegov, or
# aeiouaeiouaeiou. It contains at least one letter that appears twice in a
# row, like xx, abcdde (dd), or aabbccdd (aa, bb, cc, or dd). It does not
# contain the strings ab, cd, pq, or xy, even if they are part of one of
# the other requirements. For example:
# 
# ugknbfddgicrmopn is nice because it has at least three vowels
# (u...i...o...), a double letter (...dd...), and none of the disallowed
# substrings.
# 
# aaa is nice because it has at least three vowels and a double letter,
# even though the letters used by different rules overlap.
# 
# jchzalrnumimnmhp is naughty because it has no double letter.
# 
# haegwjzuvuyypxyu is naughty because it contains the string xy.
# 
# dvszwmarrgswjxmb is naughty because it contains only one vowel.

def three_vowels?(str)
    str.each_char
       .select { |c| ['a','e','i','o','u'].include? c }
       .group_by { |c| c }
       .count >= 3
end

def has_double_letter?(str)
    "abcdefghijklmnopqrstuvwxyz"
        .each_char
        .map { |c| c * 2 }
        .select { |x| str.include? x }
        .count >= 1
end

def has_illegal_substring?(str)
    %w(ab cd pq xy)
        .each
        .select { |x| str.include? x }
        .any?
end

print has_illegal_substring?("fdfdsafdsaabfdsafdsa"), "\n"
print has_illegal_substring?("fdsafdsafdsafdsafdsa"), "\n"
