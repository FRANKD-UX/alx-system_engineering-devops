#!/usr/bin/env ruby
# This script matches all uppercase letters in the input string.

puts ARGV[0].scan(/[A-Z]/).join
