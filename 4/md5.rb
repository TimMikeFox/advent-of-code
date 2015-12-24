#!/usr/bin/env ruby

require 'digest'

def condition(x)
    prefix = 'iwrupvqb'
    Digest::MD5.hexdigest(prefix + x.to_s).start_with? "000000"
end

puts (1..Float::INFINITY)
        .lazy
        .select{ |x| condition x }
        .first
