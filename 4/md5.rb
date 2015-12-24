#!/usr/bin/env ruby

require 'digest'

prefix = 'iwrupvqb'

(1..Float::INFINITY).each do |x|
    if Digest::MD5.hexdigest(prefix + x.to_s).start_with? "00000"
        puts x 
        break
    end
end
